import XCTest
@testable import Eventos

class EventoViewModelTests: XCTestCase {
    
    var viewModel = EventoAPIService.instance
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchEventoList() {
        viewModel.fetchEventos { result in
            switch result {
                case .success(let data):
                    XCTAssertNotNil(data, "Data não retorna nil")
                case .failure(let error):
                    XCTAssertNil(error)
                }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
