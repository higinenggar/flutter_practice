class UnbordingContent {
  String image;
  String titleone;
  String titletwo;
  String titlethree;
  String discription;

  UnbordingContent(
      {required this.image,
      required this.titleone,
      required this.titletwo,
      required this.titlethree,
      required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      titleone: 'Everything is',
      titletwo: 'straight',
      titlethree: 'to the point.',
      image: 'assets/images/page1.svg',
      discription:
          "Determine your activity planning easily with Kulino. Everything is right on the track. We will do it for you."),
  UnbordingContent(
      titleone: 'Prioritize',
      titletwo: 'your tasks',
      titlethree: 'easily, quickly.',
      image: 'assets/images/page2.svg',
      discription:
          "Organize all your to-do's lists and projects. Work together, so you can work more."),
  UnbordingContent(
      titleone: 'Win the day',
      titletwo: 'Everyday, with',
      titlethree: 'Kulino.',
      image: 'assets/images/page3.svg',
      discription: "Easy way to manage your tasks and everything with Kulino"),
];
