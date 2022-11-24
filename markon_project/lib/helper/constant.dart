import 'package:flutter/material.dart';

class Constant extends InheritedWidget {
  static Constant? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Constant>();

  const Constant({required Widget child, Key? key})
      : super(key: key, child: child);

  static const String ADD_SO = "Tambah SO";
  static const String DETAIL_CREDIT = "";
  static const String MENU_DASHBOARD = "MENU_DASHBOARD";
  static const String FORCE_LOGOUT = "FORCE_LOGOUT";
  static const String MENU_CUSTOMER_DETAIL = "MENU_CUSTOMER_DETAIL";
  static const String MENU_PRODUCT_ADD = "MENU_PRODUCT_ADD";
  static const String MENU_PRODUCT_ADD_RETUR = "MENU_PRODUCT_ADD_RETUR";
  static const String MENU_PRODUCT_ADD_VISIT_PLAN_DETAIL =
      "MENU_PRODUCT_ADD_VISIT_PLAN_DETAIL";
  static const String MENU_DETAIL_PPN = "MENU_DETAIL_PPN";
  static const String MENU_SEARCH_PRODUCT = "MENU_SEARCH_PRODUCT";
  static const String MENU_ADD_SALES_ORDER = "MENU_ADD_SALES_ORDER";
  static const String MENU_ADD_VISIT_PLAN = "MENU_ADD_VISIT_PLAN";
  static const String MENU_EDIT_SALES_ORDER = "MENU_EDIT_SALES_ORDER";
  static const String MENU_SEARCH_CREDIT = "MENU_SEARCH_CREDIT";
  static const String MENU_SEARCH_PREPARATION = "MENU_SEARCH_PREPARATION";
  static const String MENU_SEARCH_PREPARATION_DATA =
      "MENU_SEARCH_PREPARATION_DATA";

  static const String MENU_PRODUCT_EDIT = "MENU_PRODUCT_EDIT";

  static const String MENU_ADD_RETUR_PELANGGAN = "MENU_ADD_RETUR_PELANGGAN";
  static const String SALES_PERFORMANCE = "SALES_PERFORMANCE";
  static const String VISIT_PLAN = "VISIT_PLAN";
  static const String RETUR_PELANGGAN = "RETUR_PELANGGAN";
  static const String RETUR_PELANGGAN_APPROVAL = "RETUR_PELANGGAN_APPROVAL";
  static const String MENU_CREDIT = "MENU_CREDIT";
  static const String SALES_ORDER = 'SALES_ORDER';
  static const String MENU_VIEW_CREDIT = "MENU_VIEW_CREDIT";
  static const String MENU_EDIT_RETUR = "MENU_EDIT_RETUR";
  static const String MENU_EDIT_VISITPLAN = "MENU_EDIT_VISITPLAN";
  static const String MENU_VIEW_VISITPLAN = "MENU_VIEW_VISITPLAN";
  static const String MENU_EDIT_RETUR_APPROVE = "MENU_EDIT_RETUR_APPROVE";
  static const String MENU_VIEWS_CREDIT = "MENU_VIEWS_CREDIT";
  static const String MENU_VIEWS_PREPARATION = "MENU_VIEWS_PREPARATION";
  static const String MENU_VIEWS_PREPARATION_DATA =
      "MENU_VIEWS_PREPARATION_DATA";
  static const String MENU_DETAIL_CREDIT = "MENU_DETAIL_CREDIT";
  static const String MENU_PRODUCT = "MENU_PRODUCT";
  static const String PPN = 'TAX_EXCLUDE';
  static const String NON_PPN = 'TAX_INCLUDE';

  static const String TERKIRIM = 'STATUS_DELIVERY_SENT';
  static const String DITOLAK = 'STATUS_DELIVERY_REJECTED';
  static const String GAGAL_KIRIM = 'STATUS_DELIVERY_FAILED';

  static const String MENU_SEARCH_INVENTORY = "";
  static const String MENU_VIEW_INVENTORY = "MENU_VIEW_INVENTORY";
  static const String LOGIN_SCREEN = "LOGIN_SCREEN";
  static const String SESSION_EXPIRED = "SESSION_EXPIRED";
  static const String ADD_TRADE_PROMO = "TRADE_PROMO";
  static const String ADD_DISCOUNT_PROMO = "DISCOUNT_PROMO";
  static const String ADD_FLUSHOUT_PROMO = "FLUSHOUT_PROMO";
  static const String CHECK_IN = "CHECK_IN";
  static const String MAPS = 'MAPS';
  static const String GEOCODING = 'GEOCODING';
  static const String VIEW_MAPS = 'VIEWMAPS';
  static const String CHECK_IN_STOCK = "CHECK_IN_STOCK";
  static const String MENU_SO_DETAIL = "MENU_SO_DETAIL";
  static const String TEST_VIDEO_PLAYER = "TEST_VIDEO_PLAYER";
  static const String MENU_PRINT = "MENU_PRINT";
  static const String MENU_PRINT_DSO = "MENU_PRINT_DSO";
  static const String MENU_CEK_PENGIRIMAN = "MENU_CEK_PENGIRIMAN";
  static const String TG_RECEIVE = "TG_RECEIVE";

  static const String KARTU_STOCK = "KARTU_STOCK";
  static const String MENU_VIEW_SO = "MENU_VIEW_SO";
  static const String VIEW_TG_RECEIVE = "VIEW_TG_RECEIVE";
  static const String DETAIL_OPNAME = "DETAIL_OPNAME";
  static const String NEW = "DSO_STATUS_NEW";
  static const String FAKTUR = "DSO_STATUS_COMPLETE";

  static const String NEWRETUR = "RETUR_SO_STATUS_NEW";
  static const String NEWREVISE = "RETUR_SO_STATUS_NEW_REVISED";
  static const String REVISE = "RETUR_SO_STATUS_REVISED";
  static const String APPROVAL = "RETUR_SO_STATUS_APPROVED";
  static const String REJECT = "RETUR_SO_STATUS_REJECTED";
  static const String SUBMIT = "RETUR_SO_STATUS_SUBMIT";

  static const String NEW_dso = "NEW";
  static const String NEW_faktur = "FAKTUR";

  static const String NEWS = "NEW";
  static const String SUBMITS = "SUBMIT";
  static const String MONITORING_CUSTOMER = "MONITORING_CUSTOMER";
  static const String SHIPPING = "SHIPPING";

  static const String DirectionDriver = "DirectionDriver";

  //markon
  static const String MENU_HOME = "MENU_HOME";

  @override
  bool updateShouldNotify(Constant oldWidget) => false;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class ApiConstants {
  static const String Login = "login";
  static const String Edit_Retur = "updateReturPelanggan";
  static const String Edit_Visit_Plan = "modeEditVisitPlan";
  static const String LogOut = "logout";
  static const String RefreshToken = "refreshToken";

  static const String Search_Data_SO = "searchData";
  static const String Search_Data_Visitplan = "searchVisitPlan";
  static const String Search_Sched_Visitplan = "viewScheduled";
  static const String Search_UnSched_Visitplan = "viewUnscheduled";
  static const String Search_Data_Retur = "searchReturPelanggan";
  static const String Search_Product = "searchProduct";
  static const String Get_Customer_list = "getCustomerList";

  static const String REVISE_RETUR_PELANGGAN = "reviseReturPelanggan";
  static const String REJECT_RETUR_PELANGGAN = "rejectReturPelanggan";
  static const String APPROVE_RETUR_PELANGGAN = "approveReturPelanggan";

  static const String Get_faktur_list = "getSoPreparationList";
  static const String Create_SO = "create";
  static const String View_Detail_Cust = 'viewDetailCustomer';
  static const String Mode_Edit_SO = 'modeEdit';
  static const String Mode_delete_SO = 'delete';
  static const String Mode_delete_Retur = 'deleteReturPelanggan';
  static const String Mode_delete_Visit_Plan = 'deleteVisitPlan';

  static const String Submit_Faktur = 'updateDeliveryReceipt';

  static const String Change_Product_Promo = 'onChangeProductPromo';
  static const String Select_Item_Promo = 'prepareSelectItemPromo';

  static const String Change_Promo_Discount = 'onChangeProductDisc';
  static const String Select_Item_Discount = 'prepareSelectItemDisc';

  static const String Change_Promo_FlushOut = 'onChangeProductFlushOut';
  static const String Select_Item_FlushOut = 'prepareSelectItemFlushOut';

  static const String Count_Customer = 'getCountCustPromo';

  static const String Create_Credit = "created";
  static const String Search_Data_Credit = "searchDataPiutang";
  static const String View_Data_Credit = "viewDataPiutang";

  static const String Mode_Edit_Credit = "modeViewPiutang";

  static const String Search_Data_Inventory = "searchDataInvStock";
  static const String View_Data_Inventory = "modeEditInvStock";
  static const String ViewTg = "modeViewTG";
  static const String SearchTg = "searchDataTGCollector";
  static const String RevisieTg = "reviseTG";
  static const String SubmitTg = "submitTG";
  static const String Detail_Opname = "saveDetailOpname";
  static const String Kartu_Stock = "searchDataStockCard";

  static const String Menu_Check_In = "checkinSales";
  static const String Check_In_Stock = 'checkinDelivery';
  static const String Get_So_List = "getSoList";

  static const String DashboardPie = "targetSales";
  static const String PieTempo = "piutangTg";
  static const String CREATE_RETUR = "createReturPelanggan";
  static const String CREATE_VISIT_PLAN = "createVisitPlan";
  static const String Search_Data_Preparation = "searchDataPreparation";
  static const String View_Data_Preparation = "modeSubmitPreparation";
  static const String Submit_Data_Preparation = "submit";

  static const String Search_Data_Inq_Preparation = "searchDataInqPreparation";
  static const String Search_Item = "searchStockCardItem";
  static const String Upload_Gambar_Sales = 'uploadGambarSales';
  static const String Upload_Gambar_Delivery = 'uploadGambarDelivery';
  static const String Sales_perform = 'searchDataSalesPerform';
  static const String Monitoring_Customer = 'searchMonitoringCustomer';
  static const String Monitoring_Shipping = 'searchMonitoringShipping';
}

class SharedKey {
  static const String token = 'token';
  static const String refreshToken = 'refreshToken';
  static const String tokenExpDate = 'tokenExpDate';
  static const String refreshTokenExpDate = 'refreshTokenExpDate';

  static const String refreshTokenAge = 'refreshTokenAge';
  static const String userCode = 'userCode';
  static const String userPass = 'refreshTokenAge';

  static const String useToken = 'useToken';
  static const String roleCode = 'roleCode';
  static const String companyId = 'companyId';
  static const String companyName = 'companyName';
  static const String address = 'address';

//markon
  static const String url = 'url';
  static const String username = 'username';
  static const String password = 'password';
  static const String tokenAge = 'tokenAge';
  static const String tokenType = 'tokenType';
  static const String accessToken = 'accessToken';
  static const String accesTokenExpDate = 'accesTokenExpDate';
  static const String accessTokenAge = 'accessTokenAge';
}

class TradeConst {
  static const String productName = 'productName';
  static const String productId = 'productId';
  static const String productGroup = 'productGroup';
  static const String orderQty = 'orderQty';
  static const String orderUmName = 'orderUmName';
  static const String title = 'title';
  static const String multipleFlag = 'multipleFlag';
  static const String fixbonusQty = 'fixbonusQty';
  static const String bonusQty = 'bonusQty';
  static const String list = 'list';
  static const String bonusCount = 'bonusCount';

  static const String discount = 'discount';
  static const String totalBonus = 'totalBonus';
  static const String fixDisc = 'fixDisc';
  static const String discCount = 'discCount';
  static const String simbol = 'simbol';
  static const String parameter = 'parameter';

  static const String promoId = 'promoId';
  static const String promoProductDtlId = 'promoProductDtlId';

  static const String cntCustPromo = 'cntCustPromo';
}

class ProductConst {
  static const String ppn = 'ppn';
  static const String p10 = 'p10';
  static const String up = 'up';
  static const String q = 'q';
  static const String d1 = 'd1';
  static const String d2 = 'd2';
  static const String d3 = 'd3';
  static const String hasil1 = 'hasil1';
  static const String hasil2 = 'hasil2';
  static const String hasil3 = 'hasil3';
  static const String total = 'total';
}

class UserType {
  static const String admin = 'RL-ADMIN';
  static const String sales01 = 'RL-SAL001';
  static const String sales02 = 'RL-SAL002';
  static const String gudang = 'RL-GD001';
  static const String inventory = 'RL-INV002';

  static const String gudangProd = 'RL-SMG-GD01';
  static const String salesProd = 'RL-SMG-SAL01';
  static const String delivProd = 'RL-SMG-DLV01';
  static const String testgudangProd = 'RL-SMG-GD03';
  static const String helperProd = 'RL-SMG-HELPER';
}

class MonthType {
  static const String januari = 'Januari';
  static const String februari = 'Februari';
  static const String maret = 'Maret';
  static const String april = 'April';
  static const String mei = 'Mei';
  static const String juni = 'Juni';
  static const String juli = 'Juli';
  static const String agustus = 'Agustus';
  static const String september = 'September';
  static const String oktober = 'Oktober';
  static const String november = 'November';
  static const String desember = 'Desember';
}

class MonthConstant {
  static const String januari = '1';
  static const String februari = '2';
  static const String maret = '3';
  static const String april = '4';
  static const String mei = '5';
  static const String juni = '6';
  static const String juli = '7';
  static const String agustus = '8';
  static const String september = '9';
  static const String oktober = '10';
  static const String november = '11';
  static const String desember = '12';
}

class ActionConst {
  static const String tercapai = "Total Target";
  static const String gagal = "Sisa Target";
}

class HuhuConst {
  static const String totalAmount = "Total Target";
  static const String totalTG = "TotalTg";
}
