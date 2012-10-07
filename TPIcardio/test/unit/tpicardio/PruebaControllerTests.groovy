package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(PruebaController)
@Mock(Prueba)
class PruebaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prueba/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pruebaInstanceList.size() == 0
        assert model.pruebaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pruebaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pruebaInstance != null
        assert view == '/prueba/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prueba/show/1'
        assert controller.flash.message != null
        assert Prueba.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prueba/list'

        populateValidParams(params)
        def prueba = new Prueba(params)

        assert prueba.save() != null

        params.id = prueba.id

        def model = controller.show()

        assert model.pruebaInstance == prueba
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prueba/list'

        populateValidParams(params)
        def prueba = new Prueba(params)

        assert prueba.save() != null

        params.id = prueba.id

        def model = controller.edit()

        assert model.pruebaInstance == prueba
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prueba/list'

        response.reset()

        populateValidParams(params)
        def prueba = new Prueba(params)

        assert prueba.save() != null

        // test invalid parameters in update
        params.id = prueba.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prueba/edit"
        assert model.pruebaInstance != null

        prueba.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prueba/show/$prueba.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prueba.clearErrors()

        populateValidParams(params)
        params.id = prueba.id
        params.version = -1
        controller.update()

        assert view == "/prueba/edit"
        assert model.pruebaInstance != null
        assert model.pruebaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prueba/list'

        response.reset()

        populateValidParams(params)
        def prueba = new Prueba(params)

        assert prueba.save() != null
        assert Prueba.count() == 1

        params.id = prueba.id

        controller.delete()

        assert Prueba.count() == 0
        assert Prueba.get(prueba.id) == null
        assert response.redirectedUrl == '/prueba/list'
    }
}
