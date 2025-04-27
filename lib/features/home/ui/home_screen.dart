import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
import 'package:sanda/features/home/data/view_model/home_view_model.dart';
import 'package:sanda/features/home/logic/category_cubit.dart';
import 'package:sanda/features/home/ui/widgets/Welcome_Icons.dart';
import 'package:sanda/features/home/ui/widgets/category_list.dart';
import 'package:sanda/features/home/ui/widgets/category_grid.dart';
import 'package:sanda/features/home/ui/widgets/special_offer_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel viewModel = HomeViewModel();
  final _serchedTextController = TextEditingController();
  late List<ProductOrServiceModel> categoriesList;
  List<ProductOrServiceModel> _serchedItems = []; // Initialize directly here
  bool _isSearching = false; // Track if the user is searching

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Text and Icons (Shopping cart and Profile)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome 👋🏻',
                      style: TextStyles.font16MainBlueXtraBold,
                    ),
                    const WelcomeIcons(),
                  ],
                ),
                verticalSpace(16.h),
                // Search Bar
                SizedBox(
                  width: 334.w,
                  height: 37.h,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyles.font14DarkGrayRegular,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            ColorsManager.darkGray,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            'assets/icons/search.png',
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF3F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                    controller: _serchedTextController,
                    onChanged: (value) {
                      setState(() {
                        _isSearching = value.isNotEmpty; // Update search state
                        if (_isSearching) {
                          _serchedItems = categoriesList
                              .where((item) => item.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        } else {
                          _serchedItems =
                              []; // Clear search results if the search bar is empty
                        }
                      });
                    },
                  ),
                ),
                verticalSpace(16.h),
                // Special Offer Container (Green Box)
                const SpecialOfferContainer(),
                verticalSpace(20.h),
                // Categories Section
                Text(
                  viewModel.categoriesTitle,
                  style: TextStyles.font14MainBlueXtraBold,
                ),
                verticalSpace(16),
                CategoryList(categories: viewModel.getCategories()),
                verticalSpace(5),
                // Home Assistance Grid
                BlocBuilder<CategoryCubit, CategoryState>(
                  buildWhen: (previous, current) =>
                      current is CategoryLoading ||
                      current is CategorySuccess ||
                      current is CategoryFailure,
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategorySuccess) {
                      categoriesList = state.categoryList;
                      // Display search results or "Not Found" message
                      if (_isSearching) {
                        if (_serchedItems.isEmpty) {
                          return const Center(
                            child: Text(
                              "Not Found",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        } else {
                          return CategoryGrid(categoriesList: _serchedItems);
                        }
                      } else {
                        return CategoryGrid(categoriesList: categoriesList);
                      }
                    } else if (state is CategoryFailure) {
                      return Center(child: Text(state.errorMessage.toString()));
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
