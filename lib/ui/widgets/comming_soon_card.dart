part of 'widgets.dart';

class CommingSoonCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  CommingSoonCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text(movie.title);
  }
}
