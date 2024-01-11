// This file is generated
import XCTest
@_spi(Experimental) @testable import MapboxMaps

final class HillshadeLayerTests: XCTestCase {

    func testLayerProtocolMembers() {

        var layer = HillshadeLayer(id: "test-id", source: "source")
        layer.minZoom = 10.0
        layer.maxZoom = 20.0

        XCTAssertEqual(layer.id, "test-id")
        XCTAssertEqual(layer.type, LayerType.hillshade)
        XCTAssertEqual(layer.minZoom, 10.0)
        XCTAssertEqual(layer.maxZoom, 20.0)
    }

    func testEncodingAndDecodingOfLayerProtocolProperties() {
        var layer = HillshadeLayer(id: "test-id", source: "source")
        layer.minZoom = 10.0
        layer.maxZoom = 20.0

        var data: Data?
        do {
            data = try JSONEncoder().encode(layer)
        } catch {
            XCTFail("Failed to encode HillshadeLayer")
        }

        guard let validData = data else {
            XCTFail("Failed to encode HillshadeLayer")
            return
        }

        do {
            let decodedLayer = try JSONDecoder().decode(HillshadeLayer.self, from: validData)
            XCTAssertEqual(decodedLayer.id, "test-id")
            XCTAssertEqual(decodedLayer.type, LayerType.hillshade)
            XCTAssert(decodedLayer.source == "source")
            XCTAssertEqual(decodedLayer.minZoom, 10.0)
            XCTAssertEqual(decodedLayer.maxZoom, 20.0)
        } catch {
            XCTFail("Failed to decode HillshadeLayer")
        }
    }

    func testEncodingAndDecodingOfLayoutProperties() {
        var layer = HillshadeLayer(id: "test-id", source: "source")
        layer.visibility = .constant(.visible)

        var data: Data?
        do {
            data = try JSONEncoder().encode(layer)
        } catch {
            XCTFail("Failed to encode HillshadeLayer")
        }

        guard let validData = data else {
            XCTFail("Failed to encode HillshadeLayer")
            return
        }

        do {
            let decodedLayer = try JSONDecoder().decode(HillshadeLayer.self, from: validData)
            XCTAssert(decodedLayer.visibility == .constant(.visible))
        } catch {
            XCTFail("Failed to decode HillshadeLayer")
        }
    }

    func testEncodingAndDecodingOfPaintProperties() {
       var layer = HillshadeLayer(id: "test-id", source: "source")
       layer.hillshadeAccentColor = Value<StyleColor>.testConstantValue()
       layer.hillshadeAccentColorTransition = StyleTransition(duration: 10.0, delay: 10.0)
       layer.hillshadeEmissiveStrength = Value<Double>.testConstantValue()
       layer.hillshadeEmissiveStrengthTransition = StyleTransition(duration: 10.0, delay: 10.0)
       layer.hillshadeExaggeration = Value<Double>.testConstantValue()
       layer.hillshadeExaggerationTransition = StyleTransition(duration: 10.0, delay: 10.0)
       layer.hillshadeHighlightColor = Value<StyleColor>.testConstantValue()
       layer.hillshadeHighlightColorTransition = StyleTransition(duration: 10.0, delay: 10.0)
       layer.hillshadeIlluminationAnchor = Value<HillshadeIlluminationAnchor>.testConstantValue()
       layer.hillshadeIlluminationDirection = Value<Double>.testConstantValue()
       layer.hillshadeShadowColor = Value<StyleColor>.testConstantValue()
       layer.hillshadeShadowColorTransition = StyleTransition(duration: 10.0, delay: 10.0)

       var data: Data?
       do {
           data = try JSONEncoder().encode(layer)
       } catch {
           XCTFail("Failed to encode HillshadeLayer")
       }

       guard let validData = data else {
           XCTFail("Failed to encode HillshadeLayer")
           return
       }

       do {
           let decodedLayer = try JSONDecoder().decode(HillshadeLayer.self, from: validData)
           XCTAssert(decodedLayer.visibility == .constant(.visible))
           XCTAssertEqual(layer.hillshadeAccentColor, Value<StyleColor>.testConstantValue())
           XCTAssertEqual(layer.hillshadeEmissiveStrength, Value<Double>.testConstantValue())
           XCTAssertEqual(layer.hillshadeExaggeration, Value<Double>.testConstantValue())
           XCTAssertEqual(layer.hillshadeHighlightColor, Value<StyleColor>.testConstantValue())
           XCTAssertEqual(layer.hillshadeIlluminationAnchor, Value<HillshadeIlluminationAnchor>.testConstantValue())
           XCTAssertEqual(layer.hillshadeIlluminationDirection, Value<Double>.testConstantValue())
           XCTAssertEqual(layer.hillshadeShadowColor, Value<StyleColor>.testConstantValue())
       } catch {
           XCTFail("Failed to decode HillshadeLayer")
       }
    }

    func testSetPropertyValueWithFunction() {
        let layer = HillshadeLayer(id: "test-id", source: "source")
            .filter(Expression.testConstantValue())
            .source(String.testConstantValue())
            .sourceLayer(String.testConstantValue())
            .slot(Slot.testConstantValue())
            .minZoom(Double.testConstantValue())
            .maxZoom(Double.testConstantValue())
            .hillshadeAccentColor(Value<StyleColor>.testConstantValue())
            .hillshadeExaggeration(Value<Double>.testConstantValue())
            .hillshadeHighlightColor(Value<StyleColor>.testConstantValue())
            .hillshadeIlluminationAnchor(Value<HillshadeIlluminationAnchor>.testConstantValue())
            .hillshadeIlluminationDirection(Value<Double>.testConstantValue())
            .hillshadeShadowColor(Value<StyleColor>.testConstantValue())

        XCTAssertEqual(layer.filter, Expression.testConstantValue())
        XCTAssertEqual(layer.source, String.testConstantValue())
        XCTAssertEqual(layer.sourceLayer, String.testConstantValue())
        XCTAssertEqual(layer.slot, Slot.testConstantValue())
        XCTAssertEqual(layer.minZoom, Double.testConstantValue())
        XCTAssertEqual(layer.maxZoom, Double.testConstantValue())
        XCTAssertEqual(layer.hillshadeAccentColor, Value<StyleColor>.testConstantValue())
        XCTAssertEqual(layer.hillshadeExaggeration, Value<Double>.testConstantValue())
        XCTAssertEqual(layer.hillshadeHighlightColor, Value<StyleColor>.testConstantValue())
        XCTAssertEqual(layer.hillshadeIlluminationAnchor, Value<HillshadeIlluminationAnchor>.testConstantValue())
        XCTAssertEqual(layer.hillshadeIlluminationDirection, Value<Double>.testConstantValue())
        XCTAssertEqual(layer.hillshadeShadowColor, Value<StyleColor>.testConstantValue())
    }
}

// End of generated file
