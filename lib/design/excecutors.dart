import 'package:flutter/material.dart';
class Executors extends StatefulWidget {
  const Executors({super.key});
  @override
  ExecutorsState createState() => ExecutorsState();
}
class ExecutorsState extends State<Executors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xFFFFFFFF),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity,
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only( top: 239),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IntrinsicHeight(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(28),
                                                    topRight: Radius.circular(28),
                                                  ),
                                                  color: Color(0xFFFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x668E8585),
                                                      blurRadius: 3,
                                                      offset: Offset(0, -1),
                                                    ),
                                                  ],
                                                ),
                                                padding: const EdgeInsets.all(16),
                                                width: double.infinity,
                                                child: Column(
                                                    children: [
                                                      IntrinsicWidth(
                                                        child: IntrinsicHeight(
                                                          child: Container(
                                                            margin: const EdgeInsets.only( bottom: 32),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4),
                                                                      color: Color(0xFF8C8C9A),
                                                                    ),
                                                                    width: 32,
                                                                    height: 4,
                                                                    child: SizedBox(),
                                                                  ),
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( top: 1, right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/n6fmgw9t_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 11),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Vasily Ivanov",
                                                                              style: TextStyle(
                                                                                color: Color(0xFF1A1A1B),
                                                                                fontSize: 14,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.only( bottom: 4, right: 16),
                                                                              child: Text(
                                                                                "Since 2023г",
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF8C8C9A),
                                                                                  fontSize: 12,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/m40kkjpo_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/khdlxcan_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    child: SizedBox(),
                                                                  ),
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          IntrinsicHeight(
                                                                            child: Container(
                                                                              margin: const EdgeInsets.only( bottom: 20),
                                                                              child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Container(
                                                                                      margin: const EdgeInsets.only( right: 3),
                                                                                      child: Text(
                                                                                        "6 км",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 12,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ]
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          IntrinsicWidth(
                                                                            child: IntrinsicHeight(
                                                                              child: Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                        margin: const EdgeInsets.only( right: 12),
                                                                                        width: 18,
                                                                                        height: 18,
                                                                                        child: Image.network(
                                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/hfz2eey2_expires_30_days.png",
                                                                                          fit: BoxFit.fill,
                                                                                        )
                                                                                    ),
                                                                                    Container(
                                                                                        margin: const EdgeInsets.only( right: 12),
                                                                                        width: 18,
                                                                                        height: 18,
                                                                                        child: Image.network(
                                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/ckpnj08e_expires_30_days.png",
                                                                                          fit: BoxFit.fill,
                                                                                        )
                                                                                    ),
                                                                                    Container(
                                                                                        width: 18,
                                                                                        height: 18,
                                                                                        child: Image.network(
                                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/600o16q3_expires_30_days.png",
                                                                                          fit: BoxFit.fill,
                                                                                        )
                                                                                    ),
                                                                                  ]
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ]
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/cyrxpu94_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/2molfuho_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/6xhviuuf_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/5z2e1h0g_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/xsjq9nrn_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/zfbu3jfe_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/klanknvw_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/b5leni81_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/c1o12am0_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/yynztepl_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/79bztsn1_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/8lnjqh8j_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          margin: const EdgeInsets.only( bottom: 40),
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/cw3j2f95_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/m0ms6j18_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/27o256fq_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/glo14axx_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/nhs97h71_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/dqaygy83_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          width: double.infinity,
                                                          child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: const EdgeInsets.only( right: 10),
                                                                    width: 50,
                                                                    height: 49,
                                                                    child: Image.network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/fst2ver3_expires_30_days.png",
                                                                      fit: BoxFit.fill,
                                                                    )
                                                                ),
                                                                IntrinsicWidth(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.only( right: 10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.only( bottom: 4),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Vasily Ivanov",
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF1A1A1B),
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          margin: const EdgeInsets.only( right: 22),
                                                                                          child: Text(
                                                                                            "Since 2023",
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF8C8C9A),
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          margin: const EdgeInsets.only( right: 4),
                                                                                          width: 13,
                                                                                          height: 13,
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/lot86dpy_expires_30_days.png",
                                                                                            fit: BoxFit.fill,
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                        "4.5",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF8C8C9A),
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: IntrinsicHeight(
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/311qore4_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )
                                                                            ),
                                                                            IntrinsicWidth(
                                                                              child: IntrinsicHeight(
                                                                                child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      IntrinsicHeight(
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.only( bottom: 20),
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.only( right: 3),
                                                                                                  child: Text(
                                                                                                    "6 км",
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF8C8C9A),
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      IntrinsicWidth(
                                                                                        child: IntrinsicHeight(
                                                                                          child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/b5rjkzd2_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    margin: const EdgeInsets.only( right: 12),
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/01quxb03_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                                Container(
                                                                                                    width: 18,
                                                                                                    height: 18,
                                                                                                    child: Image.network(
                                                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/20dfdqh2_expires_30_days.png",
                                                                                                      fit: BoxFit.fill,
                                                                                                    )
                                                                                                ),
                                                                                              ]
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      height: 322,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          height: 322,
                                          width: double.infinity,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(40),
                                              child: Image.network(
                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Q2XUDEleJq/b65eebf0_expires_30_days.png",
                                                fit: BoxFit.fill,
                                              )
                                          )
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}