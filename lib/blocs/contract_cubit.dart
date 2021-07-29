import 'package:bloc/bloc.dart';
import '../ui/contract/contracts_list_view.dart';
import '../api/mock_contracts_service.dart';
import '../models/contract.dart';

class ContractCubit extends Cubit<List<ContractsListView>> {
  List<Contract> mockData = [];
  List<ContractsListView> contractItem = [];

  ContractCubit() : super([]);

  Future<List<Contract>> getContracts() async {
    return mockData = await MockContractsService().getContractResponse();

  }

  Future<List<ContractsListView>> getContractItem() async {
    await getContracts();
    if (mockData == []) {
      return [];
    }
    mockData.forEach((itemData) {
      contractItem.add(ContractsListView(
        contract: itemData,
      ));
    });
    
    emit(contractItem);
    return contractItem;
  }
}
