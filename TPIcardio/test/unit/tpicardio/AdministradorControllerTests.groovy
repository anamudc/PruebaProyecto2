package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(AdministradorController)
@Mock(Administrador)
class AdministradorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/administrador/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.administradorInstanceList.size() == 0
        assert model.administradorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.administradorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.administradorInstance != null
        assert view == '/administrador/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/administrador/show/1'
        assert controller.flash.message != null
        assert Administrador.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/administrador/list'

        populateValidParams(params)
        def administrador = new Administrador(params)

        assert administrador.save() != null

        params.id = administrador.id

        def model = controller.show()

        assert model.administradorInstance == administrador
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/administrador/list'

        populateValidParams(params)
        def administrador = new Administrador(params)

        assert administrador.save() != null

        params.id = administrador.id

        def model = controller.edit()

        assert model.administradorInstance == administrador
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/administrador/list'

        response.reset()

        populateValidParams(params)
        def administrador = new Administrador(params)

        assert administrador.save() != null

        // test invalid parameters in update
        params.id = administrador.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/administrador/edit"
        assert model.administradorInstance != null

        administrador.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/administrador/show/$administrador.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        administrador.clearErrors()

        populateValidParams(params)
        params.id = administrador.id
        params.version = -1
        controller.update()

        assert view == "/administrador/edit"
        assert model.administradorInstance != null
        assert model.administradorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/administrador/list'

        response.reset()

        populateValidParams(params)
        def administrador = new Administrador(params)

        assert administrador.save() != null
        assert Administrador.count() == 1

        params.id = administrador.id

        controller.delete()

        assert Administrador.count() == 0
        assert Administrador.get(administrador.id) == null
        assert response.redirectedUrl == '/administrador/list'
    }
}
