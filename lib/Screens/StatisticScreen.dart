import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:finance_manager/data/chart.dart';
import 'package:finance_manager/data/model/AddData.dart';
import 'package:finance_manager/data/model/utility.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticScreenState extends State<StatisticScreen> {
  List day = ['День', 'Неделя', 'Месяц', 'Год'];
  List f = [today(), week(), month(), year()];
  List<AddData> a = [];
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Navbar(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_back, size: 30),
                      ),
                      const Text(
                        'Статистика',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.data_usage_outlined, size: 28),
                    ],
                  ),
                  ValueListenableBuilder(
                      valueListenable: kj,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        a = f[value];
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(
                                  4,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          index_color = index;
                                          kj.value = index;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: index_color == index
                                              ? const Color.fromARGB(
                                                  255, 14, 10, 218)
                                              : Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          day[index],
                                          style: TextStyle(
                                            color: index_color == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Chart(indexx: index_color),
                          ],
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Основные расходы',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.swap_vert_outlined,
                          color: Color.fromARGB(255, 14, 10, 218),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: box.listenable(),
                      builder: (context, value, child) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: box.length,
                          itemBuilder: (BuildContext context, int index) {
                            var history = box.values.toList()[index];
                            return getList(history, index);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getList(AddData history, int index) {
  return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        history.delete();
      },
      child: get(index, history));
}

ListTile get(int index, AddData history) {
  return ListTile(
    leading: Container(
      constraints: BoxConstraints.tight(const Size.fromRadius(20)),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(width: 1.5),
      ),
      child: Icon(
        IconData(history.operationIcon, fontFamily: history.iconFamily),
      ),
    ),
    title: Text(
      history.operationName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          history.amount,
          style: TextStyle(
            fontSize: 18,
            color: history.IN == 'Доходы' ? Colors.green : Colors.red,
          ),
        ),
        Text(
          '${history.datetime.day}.' '${history.datetime.month}',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
