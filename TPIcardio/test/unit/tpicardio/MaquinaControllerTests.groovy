package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(MaquinaController)
@Mock(Maquina)
class MaquinaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/maquina/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.maquinaInstanceList.size() == 0
        assert model.maquinaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.maquinaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.maquinaInstance != null
        assert view == '/maquina/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/maquina/show/1'
        assert controller.flash.message != null
        assert Maquina.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/maquina/list'

        populateValidParams(params)
        def maquina = new Maquina(params)

        assert maquina.save() != null

        params.id = maquina.id

        def model = controller.show()

        assert model.maquinaInstance == maquina
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/maquina/list'

        populateValidParams(params)
        def maquina = new Maquina(params)

        assert maquina.save() != null

        params.id = maquina.id

        def model = controller.edit()

        assert model.maquinaInstance == maquina
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/maquina/list'

        response.reset()

        populateValidParams(params)
        def maquina = new Maquina(params)

        assert maquina.save() != null

        // test invalid parameters in update
        params.id = maquina.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/maquina/edit"
        assert model.maquinaInstance != null

        maquina.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/maquina/show/$maquina.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        maquina.clearErrors()

        populateValidParams(params)
        params.id = maquina.id
        params.version = -1
        controller.update()

        assert view == "/maquina/edit"
        assert model.maquinaInstance != null
        assert model.maquinaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/maquina/list'

        response.reset()

        populateValidParams(params)
        def maquina = new Maquina(params)

        assert maquina.save() != null
        assert Maquina.count() == 1

        params.id = maquina.id

        controller.delete()

        assert Maquina.count() == 0
        assert Maquina.get(maquina.id) == null
        assert response.redirectedUrl == '/maquina/list'
    }
}
