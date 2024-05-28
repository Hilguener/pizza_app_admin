import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app_admin/src/modules/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  State<StatefulWidget> createState() {
    return _BaseScreenState();
  }
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          html.window.location.reload();
        }
      },
      child: Scaffold(
        // backgroundColor: Colors.yellow,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: kToolbarHeight,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.go('/home');
                          },
                          child: const Text(
                            'Pizza Admin',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          onTap: () {
                            context.go('/create');
                          },
                          child: const Text(
                            'Create pizza',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context.read<SignInBloc>().add(SignOutRequired());
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Logout',
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(CupertinoIcons.arrow_right_to_line)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: widget.child)
          ],
        ),
      ),
    );
  }
}
