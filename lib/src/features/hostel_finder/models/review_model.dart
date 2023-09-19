class ReviewModel{
  String? hostelId;
  String? starRating;
  String? userId;
  String? writtenReview;
  String? date;


  ReviewModel({
    this.hostelId,
    this.date,
    this.starRating,
    this.userId,
    this.writtenReview
  });


 Map<String, dynamic> toJson() {
    return {
      "hostelId":hostelId,
      "starRating":starRating,
      "userId":userId,
      "writtenReview":writtenReview,
      "date":date
    };}


      factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      hostelId: json['hostelId'],
      starRating: json['starRating'],
      userId: json['userId'],
      writtenReview: json['writtenReview'],
      date: json['date']
    );}
  
}