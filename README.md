# Majesty

A Flutter package for customizing bottom navigation bar.

## Bottom navigation bars:

| MajestySubtleBottomNavBar |
|:-------------------------:|
| MajestySwipeNavigationBar |

Show some ❤️ and star the repo to support the project.
Also , you are more than welcome to contribute!

## MajestySubtleBottomNavBar

### Demo : 
![ezgif com-video-to-gif (6)](https://user-images.githubusercontent.com/50237142/81030872-aef2cc00-8e8a-11ea-909a-23befe6b454c.gif)


### Example : 

     Scaffold(
        bottomNavigationBar: _bottomNavBar(),
      ),

    MajestySubtleBottomNavBar _bottomNavBar() {
    return MajestySubtleBottomNavBar(
      backgroundColor: Color(0xff090708),
      animationCurve: Curves.bounceOut,
      selectorColor: Colors.redAccent,
      captions: ['Home', 'Search', 'Bookmarks'],
      selectedItemColor: Colors.white,
      nonSelectedIconColor: Color(0xff616064),
      captionsTextStyles: TextStyle(color: Colors.white),
      items: <Widget>[
        Icon(Icons.home, size: 24),
        Icon(Icons.search),
        Icon(Icons.bookmark)
      ],
      onItemPressed: (i) => print(i),
        );
       }
     }

### MajestySwipeNavigationBar

MajestySwipeNavigationBar consists of two main parts :

|    MajestySwipeScaffold   | Used as a wrapper to the Scaffold widget   |
|:-------------------------:|--------------------------------------------|
| MajestySubtleBottomNavBar | Used for bottom navigation bar of scaffold |

### Demo : 
![ezgif com-video-to-gif (7)](https://user-images.githubusercontent.com/50237142/81031098-62f45700-8e8b-11ea-9f00-54bf78b9d005.gif)


### Example : 
    MaterialApp(
      home: MajestySwipeScaffold(
        child: Scaffold(
          backgroundColor: Colors.black12,
          bottomNavigationBar: MajestySubtleBottomNavBar(
              captions: ['Home', 'Search', 'Profile'],
              backgroundColor: Colors.white,
              animationDuration: Duration(milliseconds: 200),
              selectorColor: Colors.red,
              captionsTextStyles:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              items: <Widget>[
                Icon(Icons.home),
                Icon(Icons.search),
                Icon(Icons.supervised_user_circle)
              ],
              onItemPressed: (int i) => print(i),
        ),
      ),
