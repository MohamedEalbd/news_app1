class Post{
   final String id;
   final String title;
   final String content;
   final String date_written;
   final String featured_image;
   final int votes_up;
   final int votes_down;
   final List<int> voters_up, voters_down;
   final int user_id;
   final int category_id;

   Post({this.id, this.title, this.content, this.date_written,
       this.featured_image, this.votes_up, this.votes_down, this.voters_up,
       this.voters_down, this.user_id, this.category_id});


}