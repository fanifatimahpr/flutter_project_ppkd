import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/Model/user_model.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/service/api.dart';

class HomeTabUser extends StatefulWidget {
  const HomeTabUser({super.key});

  @override
  State<HomeTabUser> createState() => _HomeTabUserState();
}

class _HomeTabUserState extends State<HomeTabUser>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<Welcome>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _futureUsers = fetchWelcome();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      appBar: AppBar(
        backgroundColor: const Color(0xff141414),
        title: const Text(
          "Top Category",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xff365194),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(
              icon: Icon(Icons.stacked_bar_chart_outlined),
              text: "Cap Rank",
            ),
            Tab(
              icon: Icon(Icons.monetization_on_outlined),
              text: "Currency",
            ),
             Tab(
              icon: Icon(Icons.monetization_on_outlined),
              text: "Price Change (24H)",
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff141414), Color(0xff365194)],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildUserList(sortedBy: "rank"),
            _buildUserList(sortedBy: "price"),
            _buildUserList(sortedBy: "change"),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList({required String sortedBy}) {
    return FutureBuilder<List<Welcome>>(
      future: _futureUsers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Terjadi kesalahan: ${snapshot.error}",
              style: const TextStyle(color: Colors.redAccent),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("Tidak ada data ditemukan.", style: TextStyle(color: Colors.white)),
          );
        }

        // ambil data
        List<Welcome> users = List.from(snapshot.data!);

        // urutkan data sesuai tab
        if (sortedBy == "rank") {
          users.sort((a, b) => (a.marketCapRank ?? 0).compareTo(b.marketCapRank ?? 0));
        } else if (sortedBy == "price") {
          users.sort((b, a) => (a.currentPrice ?? 0).compareTo(b.currentPrice ?? 0));
        } else if (sortedBy == "change") {
          users.sort((b, a) => (a.priceChange24H ?? 0)
              .compareTo(b.priceChange24H ?? 0));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return _buildUserCard(user);
          },
        );
      },
    );
  }

  Widget _buildUserCard(Welcome user) {
    final double priceChange = user.priceChange24H ?? 0;
    final bool isPositive = priceChange >= 0;

    return Card(
      color: const Color(0xff141414).withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.white.withOpacity(0.15)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.white12,
          backgroundImage: NetworkImage(user.image ?? ""),
        ),
        title: Text(
          user.name ?? "Unknown",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rank: ${user.marketCapRank ?? '-'}",
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              "24H Change: ${priceChange.toStringAsFixed(2)}%",
              style: TextStyle(
                color: isPositive ? Colors.lightGreenAccent : Colors.redAccent,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        trailing: Text(
          "💲${user.currentPrice?.toStringAsFixed(2) ?? '0'}",
          style: const TextStyle(
            color: Colors.lightGreenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}