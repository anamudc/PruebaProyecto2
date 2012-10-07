package tpicardio



import org.junit.*
import grails.test.mixin.*

@TestFor(TipController)
@Mock(Tip)
class TipControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tip/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipInstanceList.size() == 0
        assert model.tipInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipInstance != null
        assert view == '/tip/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tip/show/1'
        assert controller.flash.message != null
        assert Tip.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tip/list'

        populateValidParams(params)
        def tip = new Tip(params)

        assert tip.save() != null

        params.id = tip.id

        def model = controller.show()

        assert model.tipInstance == tip
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tip/list'

        populateValidParams(params)
        def tip = new Tip(params)

        assert tip.save() != null

        params.id = tip.id

        def model = controller.edit()

        assert model.tipInstance == tip
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tip/list'

        response.reset()

        populateValidParams(params)
        def tip = new Tip(params)

        assert tip.save() != null

        // test invalid parameters in update
        params.id = tip.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tip/edit"
        assert model.tipInstance != null

        tip.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tip/show/$tip.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tip.clearErrors()

        populateValidParams(params)
        params.id = tip.id
        params.version = -1
        controller.update()

        assert view == "/tip/edit"
        assert model.tipInstance != null
        assert model.tipInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tip/list'

        response.reset()

        populateValidParams(params)
        def tip = new Tip(params)

        assert tip.save() != null
        assert Tip.count() == 1

        params.id = tip.id

        controller.delete()

        assert Tip.count() == 0
        assert Tip.get(tip.id) == null
        assert response.redirectedUrl == '/tip/list'
    }
}
