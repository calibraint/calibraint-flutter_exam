part of 'person_list_page.dart';

/// Displays main content/body of the [Person] list page
class PersonListPageContent extends StatelessWidget {
  final PersonState state;
  final ScrollController scrollController;
  final Function() retryCallback;

  const PersonListPageContent(
      {super.key,
      required this.state,
      required this.scrollController,
      required this.retryCallback});

  @override
  Widget build(BuildContext context) {
    if (state is LoadingInitState) {
      return const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: LoaderWidget());
    } else if (state is LoadedListState) {
      var loadedState = state as LoadedListState;
      return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index < loadedState.persons.length) {
              return PersonListTile(person: loadedState.persons[index]);
            } else if (loadedState.isFooterLoading) {
              return const FooterLoadingWidget();
            } else {
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "🥳 hooray...Loaded up everything..!",
                      style: TextStyles.subtitleStyle,
                    ),
                  ));
            }
          },
          separatorBuilder: (context, index) =>
              const Divider(color: Colors.grey),
          controller: scrollController,
          itemCount: loadedState.persons.length + 1);
    } else {
      return RetryWidget(
          buttonTitle: "Refresh",
          placeholderMessage:
              "No record  found at the moment, refresh to get the list updated.",
          onPressed: () => retryCallback);
    }
  }
}
