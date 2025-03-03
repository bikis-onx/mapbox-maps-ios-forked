import XCTest
@_spi(Experimental) @testable import MapboxMaps

final class CustomSourcesIntegrationTests: MapViewIntegrationTestCase {

    func testCustomRasterSourceAdditionAndRemoval() {
        let successfullyAddedSourceExpectation = XCTestExpectation(description: "Successfully added CustomRasterSource to Map")
        successfullyAddedSourceExpectation.expectedFulfillmentCount = 1

        let successfullyRetrievedSourceExpectation = XCTestExpectation(description: "Successfully retrieved CustomRasterSource from Map")
        successfullyRetrievedSourceExpectation.expectedFulfillmentCount = 1

        mapView.mapboxMap.styleURI = .standard

        let rasterOptions = CustomRasterSourceOptions(
            clientCallback: CustomRasterSourceClient.fromCustomRasterSourceTileStatusChangedCallback { _, _ in }
        )
        let maxOverscaleFactorForParentTiles = UInt8(83)

        didFinishLoadingStyle = { mapView in
            let source = CustomRasterSource(
                id: "test-source",
                options: rasterOptions,
                maxOverscaleFactorForParentTiles: maxOverscaleFactorForParentTiles
            )

            // Add source
            do {
                try mapView.mapboxMap.addSource(source)
                successfullyAddedSourceExpectation.fulfill()
            } catch {
                XCTFail("Failed to add CustomRasterSource because of error: \(error)")
            }

            // Retrieve the source
            do {
                let retrievedSource = try mapView.mapboxMap.source(withId: "test-source", type: CustomRasterSource.self)

                XCTAssertEqual(retrievedSource.maxOverscaleFactorForParentTiles, maxOverscaleFactorForParentTiles)
                successfullyRetrievedSourceExpectation.fulfill()
            } catch {
                XCTFail("Failed to retrieve CustomRasterSource because of error: \(error)")
            }
        }
        wait(for: [successfullyAddedSourceExpectation, successfullyRetrievedSourceExpectation], timeout: 5.0)
    }

    func testCustomGeometrySourceAdditionAndRemoval() {
        let successfullyAddedSourceExpectation = XCTestExpectation(description: "Successfully added CustomGeometrySource to Map")
        successfullyAddedSourceExpectation.expectedFulfillmentCount = 1

        let successfullyRetrievedSourceExpectation = XCTestExpectation(description: "Successfully retrieved CustomGeometrySource from Map")
        successfullyRetrievedSourceExpectation.expectedFulfillmentCount = 1

        mapView.mapboxMap.styleURI = .standard
        let maxOverscaleFactorForParentTiles = UInt8(83)

        didFinishLoadingStyle = { mapView in
            var source = CustomGeometrySource(
                id: "test-source",
                options: CustomGeometrySourceOptions(
                    fetchTileFunction: { _ in },
                    cancelTileFunction: { _ in },
                    tileOptions: TileOptions()
                ),
                maxOverscaleFactorForParentTiles: maxOverscaleFactorForParentTiles
            )
            source.tileCacheBudget = .testSourceValue(.megabytes(7))

            // Add source
            do {
                try mapView.mapboxMap.addSource(source)
                successfullyAddedSourceExpectation.fulfill()
            } catch {
                XCTFail("Failed to add CustomGeometrySource because of error: \(error)")
            }

            // Retrieve the source
            do {
                let retrievedSource = try mapView.mapboxMap.source(withId: "test-source", type: CustomGeometrySource.self)
                XCTAssertEqual(retrievedSource.tileCacheBudget, .testSourceValue(.megabytes(7)))
                XCTAssertEqual(retrievedSource.maxOverscaleFactorForParentTiles, maxOverscaleFactorForParentTiles)

                successfullyRetrievedSourceExpectation.fulfill()
            } catch {
                XCTFail("Failed to retrieve CustomGeometrySource because of error: \(error)")
            }
        }
        wait(for: [successfullyAddedSourceExpectation, successfullyRetrievedSourceExpectation], timeout: 5.0)
    }
}
