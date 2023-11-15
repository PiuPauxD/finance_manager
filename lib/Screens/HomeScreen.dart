import 'package:finance_manager/data/model/AddData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _greeting() {
    final hour = TimeOfDay.now().hour;
    if (hour < 6) {
      return 'Доброй Ночи';
    } else if (hour < 12) {
      return 'Доброе Утро,';
    } else if (hour < 17) {
      return 'Добрый День,';
    } else if (hour < 21) {
      return 'Добрый Вечер';
    } else {
      return 'Доброй Ночи';
    }
  }

  var history;
  final box = Hive.box<AddData>('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 90,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person_outline_outlined,
                                size: 40,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _greeting(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 123, 122, 122),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                              ),
                              const Text(
                                'Олег Сергеевич',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: _card(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'История транзакций',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Показать все',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 14, 10, 218),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ValueListenableBuilder(
                      valueListenable: box.listenable(),
                      builder: (context, value, child) {
                        return CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  history = box.values.toList()[index];
                                  return getList(history, index);
                                },
                                childCount: box.length,
                              ),
                            ),
                          ],
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

  Widget getList(AddData history, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        history.delete();
      },
      child: get(index, history),
    );
  }

  ListTile get(int index, AddData history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Icon(
          IconData(history.operationIcon.hashCode),
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
            '${history.datetime.day}' '${history.datetime.month}',
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
}

Widget _card() {
  return Container(
    width: 320,
    height: 220,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 14, 10, 218),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        const Text(
          'Общий баланс',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BYN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 197, 190, 190),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            Text(
              '1500.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            height: 70,
            width: 280,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 11, 9, 141),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.trending_up_outlined,
                            color: Colors.green,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Text(
                            'Доходы',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 197, 190, 190),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '1800',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.trending_down_outlined,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                          ),
                          Text(
                            'Расходы',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 197, 190, 190),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '300.0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
