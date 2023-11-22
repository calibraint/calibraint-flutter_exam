import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/constants/constants.dart';

import '../../../core/util/alert_dialog_helper.dart';
import 'package:flutter_exam/core/widgets/retry_widget.dart';
import '../../../core/widgets/footer_loading_widget.dart';
import '../../../core/widgets/loader_widget.dart';
import '../domain/person_bloc.dart';
import '../../../core/domain/entities/person.dart';
import '../../../core/util/text_styles.dart';
import 'person_list_tile.dart';

part 'person_list_page_content.dart';

/// It triggers an API call to fetch data from server and displays it in the [ListView]
/// which has two options such as pull to refresh to get recent data
/// and infinite scroll to add older data into the viewport.
class PersonListPage extends StatefulWidget {
  const PersonListPage({super.key});

  @override
  State<StatefulWidget> createState() => _PersonListPageState();
}

class _PersonListPageState extends State<PersonListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    loadInitialList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(Constants.titleListPage),
        ),
        body: BlocConsumer<PersonBloc, PersonState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is PersonErrorState) {
              AlertDialogHelper.showAlert(context, state.error);
            }
          },
          builder: (context, state) {
            return RefreshIndicator(
                onRefresh: () async {
                  loadInitialList();
                },
                child: PersonListPageContent(
                    state: state,
                    scrollController: _scrollController,
                    retryCallback: () => loadInitialList()));
          },
        ),
      );

  /// It handles the infinite scroll by tracking position offset when scroll from bottom to top
  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      var state = context.read<PersonBloc>().state;
      if (state is LoadedListState &&
          !state.isFooterLoading &&
          !state.hasReachedMax) {
        context
            .read<PersonBloc>()
            .add(FetchPersonList(state.currentPageNo + 1));
      }
    }
  }

  void loadInitialList() {
    context.read<PersonBloc>().add(FetchPersonList(1));
  }
}
