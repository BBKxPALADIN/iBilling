
part of '../../ui/new_contract/new_contract.dart';



  Widget buildSaveButton(BuildContext context,bool autoValidate) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BillingColor.lightGreenColor,
        ),
      child: MaterialButton(
        onPressed: () {
          autoValidate=true;
          Navigator.of(context).pushReplacementNamed(Home.routeName);
        },
        child: Text(
          'save'.tr(),
          style: BillingThemes.textTheme.bodyText1,
        ),
      ),
    );
  }
