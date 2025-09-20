import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ozritpgpaytrack/utils/media_query_helper.dart';
import '../../Components/CommonTextFeild.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<int> currentTab = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      currentTab.value = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    currentTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/loginbg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    'Welcome 🖖',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome to your home away from home.\nFind comfort, convenience, and care, all in one place",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth,
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TabBar(
                                dividerColor: Colors.transparent,
                                controller: _tabController,
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                indicatorColor: Colors.pink,
                                indicatorWeight: 2,
                                tabs: const [
                                  Tab(text: "Login"),
                                  Tab(text: "Sign up"),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // Email Field (always visible)
                              CommonTextField1(
                                hint: "Email Address",
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Please enter email address";
                                  }
                                  if (!RegExp(
                                    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                                  ).hasMatch(value.trim())) {
                                    return "Please enter a valid email";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),

                              ValueListenableBuilder<int>(
                                valueListenable: currentTab,
                                builder: (context, value, child) {
                                  if (value == 1) {
                                    return Column(
                                      children: [
                                        CommonTextField1(
                                          hint: "Full Name",
                                          controller: nameController,
                                          validator: (value) {
                                            if (value == null || value.trim().isEmpty) {
                                              return "Please enter full name";
                                            }
                                            if (value.trim().length < 3) {
                                              return "Name must be at least 3 characters";
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(height: 15),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),

                              CommonTextField1(
                                hint: "Password",
                                controller: passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Please enter password";
                                  }
                                  if (value.trim().length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),

                              // Forgot Password for Login only
                              ValueListenableBuilder<int>(
                                valueListenable: currentTab,
                                builder: (context, value, child) {
                                  if (value == 0) {
                                    return Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          visualDensity: VisualDensity.compact,
                                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                                        ),
                                        onPressed: () {
                                          context.push("/forgot_password");
                                        },
                                        child: const Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Color(0xffF69F9F),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),

                        // Forward Button
                        Positioned(
                          bottom: -25,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFFD4A2),
                                    Color(0xFFFE0159),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  transform: GradientRotation(1.237),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pinkAccent.withOpacity(0.35),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                iconSize: 28,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
