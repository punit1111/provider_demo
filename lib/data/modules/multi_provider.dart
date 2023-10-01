import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/data/provider/post_provider.dart';
import 'package:provider_demo/data/provider/user_provider.dart';

class MultiProviderDemo extends StatefulWidget {
  const MultiProviderDemo({super.key});

  @override
  State<MultiProviderDemo> createState() => _MultiProviderDemoState();
}

class _MultiProviderDemoState extends State<MultiProviderDemo> {
  @override
  void initState() {
    super.initState();

    context.read<UserProvider>().fetchUsers();
    context.read<PostProvider>().fetchPosts();

    //Provider.of<PostProvider>(context, listen: false).fetchPosts();
    //Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                /*   ChangeNotifierProvider(
                  create: (context) => UserProvider(),
                  builder: (context, child) => context.watch().isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : context.watch().users.isEmpty
                          ? const SizedBox.shrink()
                          : ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  Text(context.watch().users[index].firstName),
                              itemCount: context.watch().users.length,
                            ),
                ),*/
                Consumer<UserProvider>(
                  builder: (context, userProvider, child) =>
                      userProvider.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : userProvider.users.isEmpty
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      Text(userProvider.users[index].firstName),
                                  itemCount: userProvider.users.length,
                                ),
                ),
                Consumer<PostProvider>(
                  builder: (context, postProvider, child) =>
                      postProvider.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : postProvider.posts.isEmpty
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      Text(postProvider.posts[index].title),
                                  itemCount: postProvider.posts.length,
                                ),
                ),

                /// Extracted as a separate widget for performance optimization.
                /// As a separate widget, it will rebuild independently from [MyHomePage].
                ///
                /// This is totally optional (and rarely needed).
                /// Similarly, we could also use [Consumer] or [Selector].
              ],
            ),
          ],
        ),
      ),
    );
  }
}
