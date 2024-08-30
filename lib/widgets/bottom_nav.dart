import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onIconPressedCallback;
  final List<IconData> icons;
  final List<String> labels;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final double iconSize;
  final double borderRadius;
  final double height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  CustomBottomNavigationBar({
    Key? key,
    required this.onIconPressedCallback,
    required this.icons,
    required this.labels,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.iconSize = 24.0,
    this.borderRadius = 30.0,
    this.height = 60.0,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _xController;
  late AnimationController _yController;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 620));
    _yController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    Listenable.merge([_xController, _yController]).addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _xController.value =
        _indexToPosition(_selectedIndex) / MediaQuery.of(context).size.width;
    _yController.value = 1.0;
  }

  double _indexToPosition(int index) {
    const buttonCount = 4.0;
    final appWidth = MediaQuery.of(context).size.width;
    final buttonsWidth = _getButtonContainerWidth();
    final startX = (appWidth - buttonsWidth) / 2;
    return startX +
        index.toDouble() * buttonsWidth / buttonCount +
        buttonsWidth / (buttonCount * 2.0);
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    super.dispose();
  }

  Widget _icon(IconData icon, bool isSelected, int index) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        onTap: () => _handlePressed(index),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          alignment: isSelected ? Alignment.topCenter : Alignment.center,
          child: AnimatedContainer(
            height: isSelected ? 40 : 20,
            duration: Duration(milliseconds: 300),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? widget.activeColor : widget.backgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: isSelected
                      ? widget.activeColor.withOpacity(0.2)
                      : widget.backgroundColor,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(5, 5),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: Opacity(
              opacity: isSelected ? _yController.value : 1,
              child: Icon(
                icon,
                size: widget.iconSize,
                color:
                    isSelected ? widget.backgroundColor : widget.inactiveColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return CustomPaint(
      painter: _BackgroundCurvePainter(
        _xController.value * MediaQuery.of(context).size.width,
        _yController.value,
        widget.backgroundColor,
      ),
    );
  }

  double _getButtonContainerWidth() {
    double width = MediaQuery.of(context).size.width;
    if (width > 400.0) {
      width = 400.0;
    }
    return width;
  }

  void _handlePressed(int index) {
    if (_selectedIndex == index || _xController.isAnimating) return;
    widget.onIconPressedCallback(index);
    setState(() {
      _selectedIndex = index;
    });

    _yController.value = 1.0;
    _xController.animateTo(
        _indexToPosition(index) / MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 620));
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        _yController.animateTo(1.0, duration: Duration(milliseconds: 1200));
      },
    );
    _yController.animateTo(0.0, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Container(
      width: appSize.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            width: appSize.width,
            height: widget.height - 10,
            child: _buildBackground(),
          ),
          Positioned(
            left: (appSize.width - _getButtonContainerWidth()) / 2,
            top: 0,
            width: _getButtonContainerWidth(),
            height: widget.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(widget.icons.length, (index) {
                return _icon(
                    widget.icons[index], _selectedIndex == index, index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundCurvePainter extends CustomPainter {
  final double xOffset;
  final double yOffset;
  final Color color;

  _BackgroundCurvePainter(this.xOffset, this.yOffset, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(xOffset, 0)
      ..quadraticBezierTo(
        xOffset + 20,
        yOffset,
        xOffset + 40,
        0,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
