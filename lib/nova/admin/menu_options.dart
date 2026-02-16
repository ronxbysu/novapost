/*
 * This GrowERP software is in the public domain under CC0 1.0 Universal plus a
 * Grant of Patent License.
 * 
 * To the extent possible under law, the author(s) have dedicated all
 * copyright and related and neighboring rights to this software to the
 * public domain worldwide. This software is distributed without any
 * warranty.
 * 
 * You should have received a copy of the CC0 Public Domain Dedication
 * along with this software (see the LICENSE.md file). If not, see
 * <http://creativecommons.org/publicdomain/zero/1.0/>.
 */

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';
import '../category/views/category_list.dart';
import '../product/product_list.dart';
import 'views/admin_db_form.dart' as local;

List<MenuOption> getMenuOptions(BuildContext context) => [
  MenuOption(
    image: 'packages/growerp_core/images/dashBoardGrey.png',
    selectedImage: 'packages/growerp_core/images/dashBoard.png',
    title: CoreLocalizations.of(context)!.main,
    route: '/',
    userGroups: [UserGroup.admin, UserGroup.employee],
    child: const local.AdminDbForm(),
  ),
  MenuOption(
    image: 'packages/growerp_core/images/companyGrey.png',
    selectedImage: 'packages/growerp_core/images/company.png',
    title: CoreLocalizations.of(context)!.organization,
    route: '/companies',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [

    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/crmGrey.png',
    selectedImage: 'packages/growerp_core/images/crm.png',
    title: CoreLocalizations.of(context)!.crm,
    route: '/crm',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/productsGrey.png',
    selectedImage: 'packages/growerp_core/images/products.png',
    title: CoreLocalizations.of(context)!.catalog,
    route: '/catalog',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
      TabItem(
        form: const ProductList(),
        label: CoreLocalizations.of(context)!.products,
        icon: const Icon(Icons.home),
      ),
      TabItem(
        form: const CategoryList(),
        label: CoreLocalizations.of(context)!.categories,
        icon: const Icon(Icons.business),
      ),
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/orderGrey.png',
    selectedImage: 'packages/growerp_core/images/order.png',
    title: CoreLocalizations.of(context)!.orders,
    route: '/orders',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/supplierGrey.png',
    selectedImage: 'packages/growerp_core/images/supplier.png',
    title: CoreLocalizations.of(context)!.inventory,
    route: '/inventory',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [

    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/accountingGrey.png',
    selectedImage: 'packages/growerp_core/images/accounting.png',
    title: CoreLocalizations.of(context)!.accounting,
    route: '/accounting',
    userGroups: [UserGroup.admin, UserGroup.employee],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/infoGrey.png',
    selectedImage: 'packages/growerp_core/images/info.png',
    title: CoreLocalizations.of(context)!.about,
    route: '/about',
    userGroups: [UserGroup.admin, UserGroup.employee],
  ),
];

// Function for localized menu options (replaces global variable)
List<MenuOption> menuOptions(BuildContext context) => [
  MenuOption(
    image: 'packages/growerp_core/images/dashBoardGrey.png',
    selectedImage: 'packages/growerp_core/images/dashBoard.png',
    title: CoreLocalizations.of(context)!.main,
    route: '/',
    userGroups: [UserGroup.admin, UserGroup.employee],
    child: const local.AdminDbForm(),
  ),
  MenuOption(
    image: 'packages/growerp_core/images/companyGrey.png',
    selectedImage: 'packages/growerp_core/images/company.png',
    title: CoreLocalizations.of(context)!.organization,
    route: '/companies',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/crmGrey.png',
    selectedImage: 'packages/growerp_core/images/crm.png',
    title: CoreLocalizations.of(context)!.crm,
    route: '/crm',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/productsGrey.png',
    selectedImage: 'packages/growerp_core/images/products.png',
    title: CoreLocalizations.of(context)!.catalog,
    route: '/catalog',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
      TabItem(
        form: const ProductList(),
        label: 'Products',
        icon: const Icon(Icons.home),
      ),
      TabItem(
        form: const CategoryList(),
        label: 'Categories',
        icon: const Icon(Icons.business),
      ),
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/orderGrey.png',
    selectedImage: 'packages/growerp_core/images/order.png',
    title: CoreLocalizations.of(context)!.orders,
    route: '/orders',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/supplierGrey.png',
    selectedImage: 'packages/growerp_core/images/supplier.png',
    title: CoreLocalizations.of(context)!.inventory,
    route: '/inventory',
    userGroups: [UserGroup.admin, UserGroup.employee],
    tabItems: [
    ],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/accountingGrey.png',
    selectedImage: 'packages/growerp_core/images/accounting.png',
    title: CoreLocalizations.of(context)!.accounting,
    route: '/accounting',
    userGroups: [UserGroup.admin, UserGroup.employee],
  ),
  MenuOption(
    image: 'packages/growerp_core/images/infoGrey.png',
    selectedImage: 'packages/growerp_core/images/info.png',
    title: CoreLocalizations.of(context)!.about,
    route: '/about',
    userGroups: [UserGroup.admin, UserGroup.employee],
  ),
];
