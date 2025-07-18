import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';
import '../services/api_service.dart';
import '../models/app_model.dart';
import '../widgets/app_grid_item.dart';
import 'app_detail_screen.dart';

class GridAppScreen extends StatefulWidget {
  const GridAppScreen({super.key});

  @override
  GridAppScreenState createState() => GridAppScreenState();
}

class GridAppScreenState extends State<GridAppScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ApiService _apiService = ApiService();
  List<AppModel> apps = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchApps();
  }

  Future<void> _fetchApps() async {
    setState(() => _isLoading = true);

    try {
      final fetchedApps = await _apiService.fetchNeonApps();
      setState(() {
        apps = fetchedApps;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching apps: $e');
      setState(() => _isLoading = false);
    }

    _refreshController.refreshCompleted();
  }

  void _onRefresh() => _fetchApps();

  void _shareApp(AppModel app) {
    SharePlus.instance.share(
      ShareParams(
        text: 'Check out ${app.appName} by Neon Apps! ${app.storeURL}',
        subject: 'Neon Apps - ${app.appName}',
      ),
    );
  }

  void _navigateToDetail(BuildContext context, AppModel app) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppDetailScreen(app: app),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mermaid\'s Tail Quest'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              header: const ClassicHeader(),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: const EdgeInsets.all(10),
                itemCount: apps.length,
                itemBuilder: (context, index) => AppGridItem(
                  app: apps[index],
                  onTap: (ctx) => _navigateToDetail(ctx, apps[index]),
                  onShare: () => _shareApp(apps[index]),
                ),
              ),
            ),
    );
  }
}
