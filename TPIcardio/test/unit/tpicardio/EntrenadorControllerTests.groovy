package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(EntrenadorController)
@Mock(Entrenador)
class EntrenadorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entrenador/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entrenadorInstanceList.size() == 0
        assert model.entrenadorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.entrenadorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.entrenadorInstance != null
        assert view == '/entrenador/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entrenador/show/1'
        assert controller.flash.message != null
        assert Entrenador.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entrenador/list'

        populateValidParams(params)
        def entrenador = new Entrenador(params)

        assert entrenador.save() != null

        params.id = entrenador.id

        def model = controller.show()

        assert model.entrenadorInstance == entrenador
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entrenador/list'

        populateValidParams(params)
        def entrenador = new Entrenador(params)

        assert entrenador.save() != null

        params.id = entrenador.id

        def model = controller.edit()

        assert model.entrenadorInstance == entrenador
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entrenador/list'

        response.reset()

        populateValidParams(params)
        def entrenador = new Entrenador(params)

        assert entrenador.save() != null

        // test invalid parameters in update
        params.id = entrenador.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entrenador/edit"
        assert model.entrenadorInstance != null

        entrenador.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entrenador/show/$entrenador.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entrenador.clearErrors()

        populateValidParams(params)
        params.id = entrenador.id
        params.version = -1
        controller.update()

        assert view == "/entrenador/edit"
        assert model.entrenadorInstance != null
        assert model.entrenadorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entrenador/list'

        response.reset()

        populateValidParams(params)
        def entrenador = new Entrenador(params)

        assert entrenador.save() != null
        assert Entrenador.count() == 1

        params.id = entrenador.id

        controller.delete()

        assert Entrenador.count() == 0
        assert Entrenador.get(entrenador.id) == null
        assert response.redirectedUrl == '/entrenador/list'
    }
}
