package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(EjercicioController)
@Mock(Ejercicio)
class EjercicioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ejercicio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ejercicioInstanceList.size() == 0
        assert model.ejercicioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ejercicioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ejercicioInstance != null
        assert view == '/ejercicio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ejercicio/show/1'
        assert controller.flash.message != null
        assert Ejercicio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ejercicio/list'

        populateValidParams(params)
        def ejercicio = new Ejercicio(params)

        assert ejercicio.save() != null

        params.id = ejercicio.id

        def model = controller.show()

        assert model.ejercicioInstance == ejercicio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ejercicio/list'

        populateValidParams(params)
        def ejercicio = new Ejercicio(params)

        assert ejercicio.save() != null

        params.id = ejercicio.id

        def model = controller.edit()

        assert model.ejercicioInstance == ejercicio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ejercicio/list'

        response.reset()

        populateValidParams(params)
        def ejercicio = new Ejercicio(params)

        assert ejercicio.save() != null

        // test invalid parameters in update
        params.id = ejercicio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ejercicio/edit"
        assert model.ejercicioInstance != null

        ejercicio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ejercicio/show/$ejercicio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ejercicio.clearErrors()

        populateValidParams(params)
        params.id = ejercicio.id
        params.version = -1
        controller.update()

        assert view == "/ejercicio/edit"
        assert model.ejercicioInstance != null
        assert model.ejercicioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ejercicio/list'

        response.reset()

        populateValidParams(params)
        def ejercicio = new Ejercicio(params)

        assert ejercicio.save() != null
        assert Ejercicio.count() == 1

        params.id = ejercicio.id

        controller.delete()

        assert Ejercicio.count() == 0
        assert Ejercicio.get(ejercicio.id) == null
        assert response.redirectedUrl == '/ejercicio/list'
    }
}
