// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:sizifi/modules/home/notifiers/tailor_state.dart';

// List<UserCredentials> tailors = [];

// class ChipTextField extends StatefulWidget {
//   const ChipTextField({super.key});

//   @override
//   State<ChipTextField> createState() => _ChipTextFieldState();
// }

// class _ChipTextFieldState extends State<ChipTextField> {
//   getTailors() async {
//     var _tailors = [];
//     _tailors = Provider.of<TailorState>(context).tailors;
//     var i = 0;
//     for (var element in _tailors) {
//       tailors.add(
//         UserCredentials(_tailors[i].name, _tailors[i].id.toString()),
//       );
//       i++;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     getTailors();
//     return Column(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ChipsInput<UserCredentials>(
//               onChipTapped: (value) {},
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.search), hintText: 'search'),
//               suggestions: _findSuggetions,
//               onChanged: _onChanged,
//               chipsBuilder: (BuildContext context,
//                   ChipsInputState<UserCredentials> state,
//                   UserCredentials profile) {
//                 return InputChip(
//                   key: ObjectKey(profile),
//                   label: Text(profile.name),
//                   // avatar: CircleAvatar(
//                   //   backgroundImage: NetworkImage(profile.imageUrl),
//                   // ),
//                   onDeleted: () => state.deleteChip(profile),
//                   onSelected: (_) => _onchiptapped(profile),
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 );
//               },
//               suggestionBuilder: (BuildContext context,
//                   ChipsInputState<UserCredentials> state,
//                   UserCredentials profile) {
//                 return ListTile(
//                   key: ObjectKey(profile),
//                   // leading: CircleAvatar(
//                   //   backgroundImage: NetworkImage(profile.imageUrl),
//                   // ),
//                   title: Text(profile.name),
//                   // subtitle: Text(profile.email),
//                   onTap: () => state.selectSuggestion(profile),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _onchiptapped(UserCredentials profile) {
//     print('$profile');
//   }

//   void _onChanged(List<UserCredentials> data) {
//     print('on changed $data');
//   }

//   Future<List<UserCredentials>> _findSuggetions(String query) async {
//     if (query.isNotEmpty) {
//       return Result.where((profile) {
//         return profile.name.contains(query) || profile.id.contains(query);
//       }).toList(growable: false);
//     } else {
//       return const <UserCredentials>[];
//     }
//   }
// }

// List<UserCredentials> Result = tailors;

// class UserCredentials {
//   final String name;
//   final String id;

//   UserCredentials(this.name, this.id);

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is UserCredentials &&
//           runtimeType == other.runtimeType &&
//           name == other.name;

//   @override
//   int get hashCode => name.hashCode;

//   @override
//   String toString() {
//     return 'Profile{$name}';
//   }
// }

// //* --------search suggestion creation-----------//

// typedef ChipsInputSuggestions<T> = Future<List<T>> Function(String query);
// typedef ChipSelected<T> = void Function(T data, bool selected);
// typedef ChipsBuilder<T> = Widget Function(
//     BuildContext context, ChipsInputState<T> state, T data);

// class ChipsInput<T> extends StatefulWidget {
//   final InputDecoration decoration;
//   final ChipsInputSuggestions suggestions;
//   final ValueChanged<List<T>> onChanged;
//   final ValueChanged<T> onChipTapped;
//   final ChipsBuilder<T> chipsBuilder;
//   final ChipsBuilder<T> suggestionBuilder;

//   const ChipsInput(
//       {super.key,
//       required this.decoration,
//       required this.suggestions,
//       required this.onChanged,
//       required this.onChipTapped,
//       required this.chipsBuilder,
//       required this.suggestionBuilder});

//   @override
//   ChipsInputState<T> createState() => ChipsInputState<T>();
// }

// class ChipsInputState<T> extends State<ChipsInput<T>>
//     implements TextInputClient {
//   static const kObjectReplace = 0xFf;

//   Set<T> _chips = {};
//   List<dynamic>? _suggestions;
//   int _searchId = 0;
//   FocusNode? _focusNode;
//   TextEditingValue _value = const TextEditingValue();
//   TextInputConnection? _connection;

//   String get text => String.fromCharCodes(
//         _value.text.codeUnits.where((ch) => ch != kObjectReplace),
//       );

//   bool get _hasInputConnection => _connection != null && _connection!.attached;

//   void requestKeyboard() {
//     if (_focusNode!.hasFocus) {
//       _openInputConnection();
//     } else {
//       FocusScope.of(context).requestFocus(_focusNode);
//     }
//   }

//   void selectSuggestion(T data) {
//     setState(() {
//       _chips.add(data);
//       updateTextInputState();
//       _suggestions = null;
//     });
//     widget.onChanged(_chips.toList(growable: false));
//   }

//   void deleteChip(T data) {
//     setState(() {
//       _chips.remove(data);
//       updateTextInputState();
//     });
//     widget.onChanged(_chips.toList(growable: false));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     _focusNode?.addListener(_onFocusChanged);
//   }

//   void _onFocusChanged() {
//     if (_focusNode!.hasFocus) {
//       _openInputConnection();
//     } else {
//       _closeInputConnectionIfNeeded();
//     }
//     setState(() {
//       // rebuild so that _TextCursor is hidden.
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode?.dispose();
//     _closeInputConnectionIfNeeded();
//     super.dispose();
//   }

//   void _openInputConnection() {
//     if (!_hasInputConnection) {
//       _connection = TextInput.attach(this, const TextInputConfiguration());
//       _connection?.setEditingState(_value);
//     }
//     _connection?.show();
//   }

//   void _closeInputConnectionIfNeeded() {
//     if (_hasInputConnection) {
//       _connection?.close();
//       _connection = null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var chipsChildren = _chips
//         .map<Widget>(
//           (data) => widget.chipsBuilder(context, this, data),
//         )
//         .toList();

//     final theme = Theme.of(context);

//     chipsChildren.add(SizedBox(
//       height: 32,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             text,
//           ),
//           _TextCaret(duration: const Duration(), resumed: _focusNode!.hasFocus)
//         ],
//       ),
//     ));

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: requestKeyboard,
//           child: InputDecorator(
//             decoration: widget.decoration,
//             isFocused: _focusNode!.hasFocus,
//             isEmpty: _value.text.isEmpty,
//             child: Wrap(
//               spacing: 4.0,
//               runSpacing: 4.0,
//               children: chipsChildren,
//             ),
//           ),
//         ),
//         // TextField(
//         //   decoration: widget.decoration,
//         // ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: _suggestions?.length ?? 0,
//             itemBuilder: (context, index) {
//               return widget.suggestionBuilder(
//                   context, this, _suggestions![index]);
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void updateEditingValue(TextEditingValue value) {
//     final oldCount = _countReplacements(_value);
//     final newCount = _countReplacements(value);
//     setState(() {
//       if (newCount < oldCount) {
//         _chips = Set.from(_chips.take(newCount));
//       }
//       _value = value;
//     });
//     _onSearchChanged(text);
//   }

//   int _countReplacements(TextEditingValue value) {
//     return value.text.codeUnits.where((ch) => ch == kObjectReplace).length;
//   }

//   @override
//   void performAction(TextInputAction action) {
//     _focusNode?.unfocus();
//   }

//   void updateTextInputState() {
//     final text = String.fromCharCodes(_chips.map((_) => kObjectReplace));
//     _value = TextEditingValue(
//       text: text,
//       selection: TextSelection.collapsed(offset: text.length),
//       composing: TextRange(start: 0, end: text.length),
//     );

//     _connection?.setEditingState(_value);
//   }

//   void _onSearchChanged(String value) async {
//     final localId = ++_searchId;
//     final results = await widget.suggestions(value);
//     if (_searchId == localId && mounted) {
//       setState(() => _suggestions = results
//           .where((profile) => !_chips.contains(profile))
//           .toList(growable: false));
//     }
//   }

//   @override
//   void connectionClosed() {
//     // TODO: implement connectionClosed
//   }

//   @override
//   // TODO: implement currentAutofillScope
//   AutofillScope? get currentAutofillScope => throw UnimplementedError();

//   @override
//   // TODO: implement currentTextEditingValue
//   TextEditingValue? get currentTextEditingValue => throw UnimplementedError();

//   @override
//   void didChangeInputControl(
//       TextInputControl? oldControl, TextInputControl? newControl) {
//     // TODO: implement didChangeInputControl
//   }

//   // @override
//   // void insertContent(KeyboardInsertedContent content) {
//   //   // TODO: implement insertContent
//   // }

//   @override
//   void insertTextPlaceholder(Size size) {
//     // TODO: implement insertTextPlaceholder
//   }

//   @override
//   void performPrivateCommand(String action, Map<String, dynamic> data) {
//     // TODO: implement performPrivateCommand
//   }

//   @override
//   void performSelector(String selectorName) {
//     // TODO: implement performSelector
//   }

//   @override
//   void removeTextPlaceholder() {
//     // TODO: implement removeTextPlaceholder
//   }

//   @override
//   void showAutocorrectionPromptRect(int start, int end) {
//     // TODO: implement showAutocorrectionPromptRect
//   }

//   @override
//   void showToolbar() {
//     // TODO: implement showToolbar
//   }

//   @override
//   void updateFloatingCursor(RawFloatingCursorPoint point) {
//     // TODO: implement updateFloatingCursor
//   }

//   @override
//   void insertCont(Object content) {
//     // TODO: implement insertContent
//   }

//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }

// class _TextCaret extends StatefulWidget {
//   const _TextCaret({required this.duration, required this.resumed});

//   final Duration duration;
//   final bool resumed;

//   @override
//   __TextCursorState createState() => __TextCursorState();
// }

// class __TextCursorState extends State<_TextCaret>
//     with SingleTickerProviderStateMixin {
//   bool displayed = false;
//   Timer? timer;

//   @override
//   void initState() {
//     timer = Timer.periodic(widget.duration, _onTimer);
//     super.initState();
//   }

//   void _onTimer(Timer timer) {
//     setState(() {
//       displayed = !displayed;
//     });
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return FractionallySizedBox(
//       heightFactor: 7.0,
//       child: Opacity(
//         opacity: displayed && widget.resumed ? 1.0 : 0.0,
//         child: Container(
//           width: 2.0,
//         ),
//       ),
//     );
//   }
// }
