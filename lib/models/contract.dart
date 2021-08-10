import 'package:json_annotation/json_annotation.dart';

part 'contract.g.dart';

@JsonSerializable()
class ContractResponse {
  List<Contract> contracts;
  List<Invoice> invoices;

  ContractResponse({this.contracts, this.invoices});

  factory ContractResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContractResponseToJson(this);
}

@JsonSerializable()
class Invoice {
  @JsonKey(name: 'service_name')
  String serviceName;
  @JsonKey(name: 'amount_of_invoice')
  int amountOfInvoice;
  @JsonKey(name: 'invoice_status')
  String invoiceStatus;
  @JsonKey(name: 'created_at')
  String createdAt;

  Invoice({
    this.serviceName,
    this.amountOfInvoice,
    this.invoiceStatus,
    this.createdAt,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

@JsonSerializable()
class Contract {
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'contract_status')
  String contractStatus;
  int amount;
  @JsonKey(name: 'last_invoice')
  int lastInvoice;
  @JsonKey(name: 'invoice_amount')
  int invoiceAmount;
  String address;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'organization_itn')
  int organizationItn;

  Contract({
    this.fullName,
    this.contractStatus,
    this.amount,
    this.lastInvoice,
    this.invoiceAmount,
    this.address,
    this.createdAt,
    this.organizationItn,
  });

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  Map<String, dynamic> toJson() => _$ContractToJson(this);
}
