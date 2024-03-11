# ElevenLabsAsyncHTTPClient

`ElevenLabsAsyncHTTPClient` is generated from ElevenLab's openapi spec using the [`swift-openapi-generator`](https://github.com/apple/swift-openapi-generator).

## Installation

Add below to your `Package.swift` dependencies.
```
.package(url: "https://github.com/dangdennis/ElevenLabsAsyncHTTPClient.git", from: "1.0.0"),
```

## Usage

```swift
import ElevenLabsAsyncHTTPClient
import Foundation
import OpenAPIAsyncHTTPClient
import OpenAPIRuntime

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

  func synthesize(text: String) async throws
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

```

```
// Somewhere else...
import OpenAPIAsyncHTTPClient

let t2sService = TextToSpeechService(transport: AsyncHTTPClientTransport())
```

## Build

To regenerate the client, run
```
swift package generate-code-from-openapi
```
