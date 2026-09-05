class ResponseModel {
  final String model;
  final String role;
  final String reply;

  ResponseModel(this.model, this.role, this.reply, Usage usage);

  factory ResponseModel.fromjson(String model, String role, String response, Usage usage) {
    return ResponseModel(model, role, response, usage);
  }
}

class Usage {
  final int completionTokens;
  final int promptTokens;
  final int totalTokens;
  Usage(this.completionTokens, this.promptTokens, this.totalTokens);
}
