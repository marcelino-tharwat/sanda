import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
import 'package:sanda/features/home/data/view_model/home_view_model.dart';
import 'package:sanda/features/home/logic/category/category_cubit.dart';
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
  List<ProductOrServiceModel> _serchedItems = [];
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: ColorsManager.wight,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text and Icons (Shopping cart and Profile)
              ClipPath(
                key: const ValueKey('header_clip'),
                clipper: const ContainerClipper(),
                child: Container(
                  color: ColorsManager.mainBlue,
                  height: 195.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        verticalSpace(30),
                        const WelcomeIcons(),
        
                        verticalSpace(10.h),
                        // Search Bar
                        SizedBox(
                          width: double.infinity,
                          height: 40.h,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyles.font14DarkGrayRegular,
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.w),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 12.w),
                            ),
                            controller: _serchedTextController,
                            onChanged: (value) {
                              setState(() {
                                _isSearching = value.isNotEmpty;
                                if (_isSearching) {
                                  _serchedItems = categoriesList
                                      .where((item) => item.name
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                      .toList();
                                } else {
                                  _serchedItems = [];
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Special Offer Container (Green Box)
                    const SpecialOfferContainer(),
                    verticalSpace(20.h),
                    // Categories Section
                    Text(
                      viewModel.categoriesTitle,
                      style: TextStyles.font14MainBlueXtraBold,
                    ),
                    verticalSpace(16.h),
                    CategoryList(categories: viewModel.getCategories()),
                    verticalSpace(5.h),
                    // Home Assistance Grid
                    BlocBuilder<CategoryCubit, CategoryState>(
                      buildWhen: (previous, current) =>
                          current is CategoryLoading ||
                          current is CategorySuccess ||
                          current is CategoryFailure,
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                              return CategoryGrid(
                                  categoriesList: _serchedItems);
                            }
                          } else {
                            return CategoryGrid(
                                categoriesList: categoriesList);
                          }
                        } else if (state is CategoryFailure) {
                          return Center(
                              child: Text(state.errorMessage.toString()));
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  const ContainerClipper();
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 30.h);
    // منحنى في الأسفل - كرفات
    path.quadraticBezierTo(size.width * 0.25, size.height - 70.h,
        size.width * 0.5, size.height - 30.h);
    path.quadraticBezierTo(
        size.width * 0.75, size.height, size.width, size.height - 30.h);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
