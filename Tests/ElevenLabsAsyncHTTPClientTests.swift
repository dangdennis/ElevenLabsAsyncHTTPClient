import XCTest
import OpenAPIAsyncHTTPClient
import OpenAPIRuntime

@testable import ElevenLabsAsyncHTTPClient

final class ElevenLabsAsyncHTTPClientTests: XCTestCase {
  func testExample() async {

    let service = TextToSpeechService(transport: AsyncHTTPClientTransport())
    let _ = try! await service.synthesize(text: "Hello, World!")
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertEqual("Hello, World!", "Hello, World!")
  }
}

enum ElevenLabsModel: String {
  case eleven_multilingual_v2 = "eleven_multilingual_v2"
}

enum ElevenLabsVoices: String {
  case voice1 = "*******"
}

struct TextToSpeechService {
  let client: ElevenLabsAsyncHTTPClient.APIProtocol
  let apiKey = "*******"

  init(transport: any ClientTransport) {
    self.client = Client(serverURL: URL(string: "https://api.elevenlabs.io")!, transport: transport)
  }

  public func synthesize(text: String) async throws
    -> Operations.Text_to_speech_v1_text_to_speech__voice_id__post.Output
  {
    return try await client.Text_to_speech_v1_text_to_speech__voice_id__post(
      Operations.Text_to_speech_v1_text_to_speech__voice_id__post.Input(
        path: .init(voice_id: ElevenLabsVoices.voice1.rawValue),
        headers: .init(xi_hyphen_api_hyphen_key: apiKey),
        body: .json(
          .init(
            text: text,
            model_id: ElevenLabsModel.eleven_multilingual_v2.rawValue
          ))
      ))
  }
}