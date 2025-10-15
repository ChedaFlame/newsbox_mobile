import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../connectivity/connectivity_bloc.dart';

class ConnectivityBanner extends StatelessWidget {
  const ConnectivityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        // if (state is InternetConnected){
        //   return Container(
        //     width: double.infinity,
        //     color: Colors.red,
        //     padding: EdgeInsets.all(12),
        //     child: Text(
        //       "Coccted",
        //       style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        //       textAlign: TextAlign.center,
        //     ),
        //   );
        // }

        // if (state is ConnectivityOffline) {
        //   return Container(
        //     width: double.infinity,
        //     color: Colors.red,
        //     padding: EdgeInsets.all(12),
        //     child: Text(
        //       state.connectionError,
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //       textAlign: TextAlign.center,
        //     ),
        //   );
        // }else if (state is ConnectivityOnline) {
        //
        //   return Container(
        //     width: double.infinity,
        //     color: Colors.red,
        //     padding: EdgeInsets.all(12),
        //     child: Text(
        //       'state.connectionType.name',
        //       style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        //       textAlign: TextAlign.center,
        //     ),
        //   );
        // }
         return SizedBox.shrink();
      },
    );
  }
}

