import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_web/razorpay_web.dart';
import '../model/cart_model.dart';
import '../service/firestoreService.dart';
import 'orderedItemsPage.dart';
// import 'orders.dart';


class PurchaseDetailsPage extends StatefulWidget {
  final Shoe shoe;
  final String selectedColor;
  final String selectedSize;

  PurchaseDetailsPage({
    required this.shoe,
    required this.selectedColor,
    required this.selectedSize
  });

  @override
  _PurchaseDetailsPageState createState() => _PurchaseDetailsPageState();
}

class _PurchaseDetailsPageState extends State<PurchaseDetailsPage> {
  late Razorpay _razorpay;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
    _addressController.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    List<String> orderedItems = ['Item 1', 'Item 2', 'Item 3'];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PurchasesPage(),
      ),
    );;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    print("Payment Error: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    print("External Wallet: ${response.walletName}");
  }

  void _openCheckout() {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': widget.shoe.price * 100, // Amount in paise
      'name': widget.shoe.name,
      'description': widget.shoe.description,
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Details',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              FutureBuilder<DocumentSnapshot>(
                future: fetchUserData(user!.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('No data found'));
                  }
        
                  var userData = snapshot.data!.data() as Map<String, dynamic>;
                  _phoneController.text = userData['phoneNumber'] ?? 'Not Set';
                  _addressController.text = userData['address'] ?? 'Not Set';
        
                  return Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .15,
                      ),
                      Center(
                        child: Container(
                          height: 200,
                          child: Image(image: AssetImage(widget.selectedColor)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('Product: ${widget.shoe.name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('Size: ${widget.selectedSize}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Text('Price: \₹${widget.shoe.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 20,),
                      Text('Address:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextField(
                          controller: _addressController,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                              contentPadding: EdgeInsets.all(10),
                              border: UnderlineInputBorder(borderSide: BorderSide.none)
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('Phone Number:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextField(
                          controller: _phoneController,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              contentPadding: EdgeInsets.all(10),
                              border: UnderlineInputBorder(borderSide: BorderSide.none)
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: OutlinedButton(
                          onPressed: _openCheckout,
                          child: Container(
                            height: 60,
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            child: Center(child: Text('Make Payment', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 17),)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
        

            ],
          ),
        ),
      ),
    );
  }
}
