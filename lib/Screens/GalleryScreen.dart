import 'package:flutter/material.dart';
import 'package:gohar_shahi/RouteAnimation/FadeAnimations.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery"),
      
      ),
      body: GridView.builder(
        itemCount: arro.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,mainAxisSpacing: 5,crossAxisSpacing: 5),
           itemBuilder: (context,idx){
        return InkWell(
          onTap: (){
            Navigator.of(context).push(createDropFadeRoute(FullImageView(ind: idx,)));
          },
          child: Image.asset("assets/SarkarPicture/${arro[idx]}",fit: BoxFit.cover,cacheWidth: (MediaQuery.of(context).size.width / 4).toInt(),));
      })
    );
  }
}



class FullImageView extends StatefulWidget {
  final int ind ;
  const FullImageView({super.key, required this.ind});

  @override
  State<FullImageView> createState() => _FullImageViewState();
}

class _FullImageViewState extends State<FullImageView> {
    late PageController _controller ;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.ind);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        pageSnapping: true,
        itemCount: arro.length,
        
        itemBuilder: (context,idx){
        
        return Image.asset("assets/SarkarPicture/${arro[idx]}",fit: BoxFit.contain,);
      }),
    );
  }
}

List<String> arro = [
"13.jpg",
"101.jpg",
"102.jpg",
"103.jpg",
"104.jpg",
"105.jpg",
"106.jpg",
"107.jpg",
"108.jpg",
"109.jpg",
"10.jpg",
"110.jpg",
"111.jpg",
"112.jpg",
"113.png",
"114.jpg",
"11.jpeg",
"12.jpeg",
"100.jpg",
"115.jpg",
"14.jpg",
"15.jpg",
"116.jpg",
"16.jpeg",
"17.jpg",
"18.jpg",
"19.jpg",
"1.jpg",
"20.jpg",
"21.jpg",
"22.jpg",
"23.jpg",
"24.jpg",
"25.jpg",
"26.jpg",
"27.jpg",
"28.jpg",
"29.jpg",
"2.jpeg",
"30.jpg",
"31.jpg",
"32.jpg",
"33.jpg",
"34.jpg",
"117.jpg",
"35.jpg",
"36.jpg",
"37.jpg",
"118.jpg",
"38.jpg",
"39.jpg",
"3.jpg",
"40.jpg",
"41.jpg",
"42.jpg",
"43.jpg",
"44.jpg",
"45.jpg",
"46.jpg",
"47.jpg",
"48.jpg",
"49.jpg",
"4.jpeg",
"50.jpg",
"119.jpg",
"51.jpg",
"52.jpg",
"53.jpg",
"54.jpg",
"120.jpg",
"55.jpg",
"56.jpg",
"57.jpg",
"58.jpg",
"59.jpg",
"5.jpeg",
"60.jpg",
"61.jpg",
"62.jpg",
"121.jpg",
"63.jpg",
"64.jpg",
"65.jpg",
"66.jpg",
"67.jpg",
"68.jpg",
"69.jpg",
"6.jpg",
"70.jpg",
"71.jpg",
"72.jpg",
"73.jpg",
"74.jpg",
"75.jpg",
"76.jpg",
"77.jpg",
"78.jpg",
"79.jpg",
"7.jpg",
"80.jpg",
"81.jpg",
"82.jpg",
"83.jpg",
"84.jpg",
"85.jpg",
"86.jpg",
"87.jpg",
"88.jpg",
"89.jpg",
"8.jpg",
"90.jpg",
"91.jpg",
"92.jpg",
"93.jpg",
"94.jpg",
"95.jpg",
"96.jpg",
"97.jpg",
"98.jpg",
"99.jpg",
"9.jpg",
];
