import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/Model/user_model.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/service/api.dart';

class UserScreen2 extends StatefulWidget {
  const UserScreen2({super.key});

  @override
  State<UserScreen2> createState() => _UserScreen2State();
}

class _UserScreen2State extends State<UserScreen2> {
  final TextEditingController _searchController = TextEditingController();
  List<Welcome> _allUsers = [];
  List<Welcome> _filteredUsers = [];
  bool _isLoading = true;
  String _errorMessage = '';

 Future<void> _loadCrypto() async {
    try {
      final data = await fetchWelcome();
      setState(() {
        _allUsers = data;
        _filteredUsers = data; // awalnya tampil semua
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _searchCrypto(String query) {
    final filtered = _allUsers.where((crypto) {
      final name = crypto.name?.toLowerCase() ?? '';
      final symbol = crypto.symbol?.toLowerCase() ?? '';
      final searchQuery = query.toLowerCase();
      return name.contains(searchQuery) || symbol.contains(searchQuery);
    }).toList();

    setState(() {
      _filteredUsers = filtered;
    });
  }
  @override
  void initState() {
    super.initState();
    _loadCrypto();
    _searchController.addListener(() {
      _searchCrypto(_searchController.text);
    });
  }

  void _loadUsers() async {
    final users = await fetchWelcome();
    setState(() {
      _allUsers = users;
      _filteredUsers = users;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _allUsers
          .where((user) =>
              user.name!.toLowerCase().contains(query) ||
              user.symbol!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildBackground(),
            _buildLayer(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff141414),
            Color(0xff365194),
          ],
        ),
      ),
    );
  }

  Widget _buildLayer() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 15),
          _buildSearchBar(),
          SizedBox(height: 15),
          _buildUserList(),
        ],
      ),
    );
  }

  // --- Header ---
  Widget _buildHeader() {
    return const Text(
      "Portfolio",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xfff2f3f4),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search by Name...',
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.search, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          // borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          // borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
        ),
      ),
    );
  }
  // --- FutureBuilder User Data ---
  Widget _buildUserList() {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _filteredUsers.length,
          itemBuilder: (context, index) {
            final user = _filteredUsers[index];
            return _buildUserTile(user);
          },
        );
    //   },
    // );
  }

  // --- Widget tiap item user ---
  Widget _buildUserTile(Welcome user) {
    return Card(
      color: Color(0xff141414).withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(vertical: 3),
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(user.image ?? ""),
        ),
        title: Text(
          "${user.name}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        subtitle: 
        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Market Cap Rank: ${user.marketCapRank}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),

                            // width(30),
                            Text(
                              '💲${user.currentPrice}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),

      ),
    );
  }
}
