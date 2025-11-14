// import 'package:flutter/material.dart';
// import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/profil_model.dart';
// import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/registermodel.dart';
// import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/preferences/preference_handler.dart';
// import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/service/api.dart';
// import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/views/login_day33.dart';
// import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/views/splash_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class ProfilePage extends StatefulWidget {
//   final RegisterModel user;
//   ProfilePage({Key? key, required this.user}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   late Future<ProfileModel> _profileFuture;
//   @override
//   void initState() {
//     super.initState();
//     _profileFuture = AuthAPI.getProfile();
//   }

//   // ====== LOGOUT ========
//   Future<void> _handleLogout() async {
//     await PreferenceHandlerDay33.removeLogin();
//     // await PreferenceHandlerDay33.removeToken();

//     if (mounted) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => SigninPageDay33()),
//         (route) => false,
//       );
//     }
//   }
  
//   Future<void> _editProfile(User user) async {
//     final nameC = TextEditingController(text: user.name);
//     //final emailC = TextEditingController(text: user.email);

//     final result = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Edit Profil"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             spacing: 16,
//             children: [
//               TextField(
//                 controller: nameC,
//                 decoration: InputDecoration(
//                   labelText: "Nama",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               // TextField(
//               //   controller: emailC,
//               //   decoration: InputDecoration(
//               //     labelText: "Email",
//               //     border: OutlineInputBorder(),
//               //   ),
//               // ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Batal"),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, true),
//               child: Text("Simpan"),
//             ),
//           ],
//         );
//       },
//     );

//     // Jika user klik "Simpan"
//     if (result == true) {
//       try {
//         final updateResponse = await AuthAPI.updateProfile(
//           name: nameC.text.trim(),
//         );

//         if (!mounted) return;

//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("Profil berhasil diperbarui")));

//         // refresh data
//         setState(() {
//           _profileFuture = AuthAPI.getProfile();
//         });
//       } catch (e) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("Gagal update profil: $e")));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(children: [_buildBackground(), _buildLayer()]),
//       ),
//     );
//   }

//   Widget _buildBackground() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: AlignmentGeometry.topLeft,
//           end: AlignmentGeometry.bottomRight,
//           colors: [Color(0xff00072d),
//            Color(0xff0a2472), 
//           //  Color(0xff1a43bf)
//            ]
//           )
//       ),
//       width: double.infinity,
//       height: double.infinity,
//     );
//   }


//   Widget _buildLayer() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(22),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //Header
//           _buildHeader(),
//           height(20),

//           //List Info Akun
//           _buildSectionTitle("Informasi Akun"),
//           height(8),
//           _buildInfoUserAccount(),

//           //Edit TextButton
//           FutureBuilder(
//   future: _profileFuture,
//   builder: (context, snapshot) {
//     if (!snapshot.hasData || snapshot.data!.data == null) {
//       return SizedBox();
//     }
//     final user = snapshot.data!.data!;
//     return _buildEditBottom(user);
//   },
// ),

//           height(15),

//           //Pengaturan
//           _buildSectionTitle("Pengaturan Akun"),
//           height(8),
//           _buildSettingsAccount(),
//           height(40),

//           //Log Out
//           _buildLogOutButton(
//             text: "Log Out",
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => SplashScreenDay33()),
//                 (route) => false,
//               );
//             },
//           ),

//           height(15),

//           // Delete Acc
//           // _buildDeleteAccountButton(),
//           // height(40),

//           //App Version
//           _buildAppVersion(),
//           height(50),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xff00072d).withOpacity(0.3),
//                 Color(0xff0a2472).withOpacity(0.3),
//               ],
//             ),
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 8,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Icon(Icons.person, color: Color(0xFF2F6B6A), size: 24),
//         ),
//         width(12),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Profil',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 color: Color.fromARGB(255, 255, 255, 255),
//               ),
//             ),
//             Text(
//               'Informasi Profil Pengguna',
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         color: Color(0xFF2F6B6A),
//         fontSize: 15,
//         fontWeight: FontWeight.w600,
//       ),
//     );
//   }
// Widget _buildInfoUserAccount(Data user) {
//   return Column(
//     children: [
//       _buildInfoItem(
//         icon: Icons.person_outline,
//         title: 'Nama Lengkap',
//         subtitle: user.name ?? '-',
//         onTap: () {},
//       ),
//       SizedBox(height: 12),
//       _buildInfoItem(
//         icon: Icons.email_outlined,
//         title: 'Email',
//         subtitle: user.email ?? '-',
//         onTap: () {},
//       ),
//     ],
//   );
// }

// // Widget _buildInfoUserAccount(User user) {
// //   return Column(
// //     children: [
// //       _buildInfoItem(
// //         icon: Icons.person_outline,
// //         title: 'Nama Lengkap',
// //         subtitle: user.name ?? '-',
// //         onTap: () {},
// //       ),
// //       SizedBox(height: 12),
// //       _buildInfoItem(
// //         icon: Icons.email_outlined,
// //         title: 'Email',
// //         subtitle: user.email ?? '-',
// //         onTap: () {},
// //       ),
// //       SizedBox(height: 12),
// //     ],
// //   );
// // }
// Widget _buildEditBottom(Data user) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       TextButton(
//         onPressed: () => _editProfile(user),
//         child: const Text(
//           "Edit Informasi Akun",
//           style: TextStyle(
//             fontSize: 13,
//             color: Color.fromARGB(255, 122, 122, 122),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ],
//   );
// }


//   Widget _buildSettingsAccount() {
//     return Column(
//       children: [
//         _buildInfoItem(
//           icon: Icons.notifications_outlined,
//           title: 'Notifikasi',
//           subtitle: 'Atur pengingat dan pemberitahuan',
//           onTap: () {},
//         ),
//         const SizedBox(height: 12),
//         _buildInfoItem(
//           icon: Icons.lock_outline,
//           title: 'Keamanan',
//           subtitle: 'Ubah kata sandi & keamanan akun',
//           onTap: () {},
//         ),
//       ],
//     );
//   }

//   Widget _buildLogOutButton({
//     required String text,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       height: 56,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [ Color(0xff123499),
//           Color(0xff1a43bf),],
//         ),
//         borderRadius: BorderRadius.circular(26),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(26),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget _buildDeleteAccountButton() {
//   //   return Container(
//   //     width: double.infinity,
//   //     height: 56,
//   //     decoration: BoxDecoration(
//   //       color: Colors.white,
//   //       borderRadius: BorderRadius.circular(22),
//   //       border: Border.all(color: Colors.red.withOpacity(0.2), width: 1.5),
//   //     ),
//   //     child: InkWell(
//   //       onTap: () {
//   //         showDialog(
//   //           context: context,
//   //           builder: (context) {
//   //             return AlertDialog(
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.circular(12),
//   //               ),
//   //               title: const Text(
//   //                 "Hapus Akun?",
//   //                 style: TextStyle(fontWeight: FontWeight.bold),
//   //               ),
//   //               content: const Text(
//   //                 "Apakah kamu yakin ingin menghapus akun ini? Semua data akan hilang permanen.",
//   //               ),
//   //               actions: [
//   //                 TextButton(
//   //                   onPressed: () {
//   //                     Navigator.pop(context); // Tutup dialog
//   //                   },
//   //                   child: const Text("Batal"),
//   //                 ),
//   //                 ElevatedButton(
//   //                   style: ElevatedButton.styleFrom(
//   //                     backgroundColor: Colors.red,
//   //                   ),
//   //                   onPressed: () async {
//   //                     final db = DBHelper();
//   //                     await DBHelper.deleteUser(widget.user.id!);

//   //                     Navigator.pop(context); // Tutup dialog

//   //                     Fluttertoast.showToast(
//   //                       msg: "Akun berhasil dihapus",
//   //                       gravity: ToastGravity.BOTTOM,
//   //                     );

//   //                     Navigator.pushAndRemoveUntil(
//   //                       context,
//   //                       MaterialPageRoute(builder: (context) => SplashPage()),
//   //                       (route) => false,
//   //                     );
//   //                   },
//   //                   child: const Text(
//   //                     "Hapus",
//   //                     style: TextStyle(
//   //                       color: Color.fromARGB(255, 255, 255, 255),
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             );
//   //           },
//   //         );
//   //       },
//   //       child: Row(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           const Icon(Icons.delete, color: Colors.red),
//   //           width(10),
//   //           Text(
//   //             "Hapus Akun",
//   //             style: TextStyle(
//   //               fontSize: 14,
//   //               color: Colors.red.shade700,
//   //               fontWeight: FontWeight.w500,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _buildAppVersion() {
//     return Center(
//       child: Column(
//         children: [
//           Text(
//             'Versi 1.0.0',
//             style: TextStyle(color: Colors.grey[600], fontSize: 12),
//           ),
//           height(5),
//           Text(
//             'Copyright 2025 stuntinQ.',
//             style: TextStyle(color: Colors.grey[600], fontSize: 11),
//           ),
//           Text(
//             'All right reserved.',
//             style: TextStyle(color: Colors.grey[600], fontSize: 11),
//           ),
//         ],
//       ),
//     );
//   }

//   // Future<void> _onEdit(UserModel user) async {
//   //   final nameC = TextEditingController(text: user.fullname);
//   //   final emailC = TextEditingController(text: user.email);
//   //   final phoneC = TextEditingController(text: user.phonenumber);

//   //   final res = await showDialog(
//   //     context: context,
//   //     builder: (context) {
//   //       return AlertDialog(
//   //         shape: RoundedRectangleBorder(
//   //           borderRadius: BorderRadius.circular(20),
//   //         ),
//   //         title: Text("Edit Profil"),
//   //         content: Column(
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             _editField(nameC, "Nama Lengkap"),
//   //             height(16),
//   //             _editField(emailC, "Email"),
//   //             height(16),
//   //             _editField(phoneC, "Nomor Telepon"),
//   //           ],
//   //         ),
//   //         actions: [
//   //           TextButton(
//   //             onPressed: () => Navigator.pop(context, false),
//   //             child: Text("Cancel"),
//   //           ),
//   //           TextButton(
//   //             onPressed: () => Navigator.pop(context, true),
//   //             child: Text("Save"),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );

//   //   if (res == true) {
//   //     final updated = UserModel(
//   //       id: user.id,
//   //       fullname: nameC.text,
//   //       email: emailC.text,
//   //       phonenumber: phoneC.text,
//   //     );

//   //     //Edit User
//   //     await DBHelper.updateUser(updated);

//   //     setState(() {
//   //       widget.user.fullname = updated.fullname;
//   //       widget.user.email = updated.email;
//   //       widget.user.phonenumber = updated.phonenumber;
//   //     });

//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Row(
//   //           children: [
//   //             Icon(Icons.check_circle, color: Colors.white),
//   //             SizedBox(width: 12),
//   //             Text('Data Berhasil Diedit'),
//   //           ],
//   //         ),
//   //         backgroundColor: Color(0xFF2F6B6A),
//   //         behavior: SnackBarBehavior.floating,
//   //         shape: RoundedRectangleBorder(
//   //           borderRadius: BorderRadius.circular(12),
//   //         ),
//   //         margin: EdgeInsets.all(16),
//   //       ),
//   //     );
//   //   }
//   // }

// //   Widget _editField(TextEditingController c, String label) {
// //     return TextField(
// //       controller: c,
// //       decoration: InputDecoration(
// //         labelText: label,
// //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
// //       ),
// //     );
// //   }
// // }

// Widget _buildInfoItem({
//   required IconData icon,
//   required String title,
//   required String subtitle,
//   required VoidCallback onTap,
// }) {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       border: Border.all(
//         color: const Color(0xFF40E0D0).withOpacity(0.2),
//         width: 1.5,
//       ),
//     ),
//     child: InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Icon(icon, color: Color(0xFF2F6B6A)),
//             SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     subtitle,
//                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//             Icon(Icons.chevron_right, color: Colors.grey),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }
// // SizedBox helpers
// SizedBox height(double h) => SizedBox(height: h);
// SizedBox width(double w) => SizedBox(width: w);
