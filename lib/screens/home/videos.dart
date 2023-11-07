
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {

  Videos({super.key, });

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  late List<YoutubePlayerController> _controllers;
List<String>linkURL=["https://youtu.be/3gnTjbrTJGc?si=ix_C09UjXFIQfb5j",
                    "https://youtu.be/V4EKDgP84TU?si=bOEF5ZUIpLR1A9QB",
                     "https://youtu.be/ipFUM84lZek?si=YvGom6wKIJHj8wg9",
                     "https://youtu.be/k_iSLT4B_cs?si=mVoIznr9UTDhQk-0",
                     "https://youtu.be/BLdPks74qZo?si=-R04TeCWiT5mkfs1",
                     "https://youtu.be/2VCxfews9TU?si=rIFsicb_AIhvEC3w",
                     "https://youtu.be/P6_5bayrUOo?si=Pr8WwM1o-Rc9mTUd",
                     "https://youtu.be/CvzLVpf_0bA?si=C4t1BecHzE9cXSSn",
                     "https://youtu.be/VM6GR8uf2cI?si=nNTcjEz_6jdSXImb",
                     "https://youtu.be/4z93ALdpmJI?si=CcFC8kl1N_RCO3dk", 
                     "https://youtu.be/NMVotNhtTYQ?si=SdSXKNUA1FnK7pRF"];
  @override
  void initState() {
    super.initState();
    final _urls = linkURL;
    _controllers = _urls.map((url) {
      final videoId = YoutubePlayer.convertUrlToId(url);
      return YoutubePlayerController(
          initialVideoId: videoId!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ));
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Training Videos'),
      backgroundColor: Colors.blue,
      centerTitle: true,),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: _controllers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (_controllers.isEmpty) {
                return const Center(child: Text('No Videos'));
              }
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: YoutubePlayer(
                    thumbnail: const Text(''),
                    controller: _controllers[index],
                    showVideoProgressIndicator: true,
                    progressColors: const ProgressBarColors(
                      handleColor: Colors.indigo,
                      playedColor: Colors.indigo,
                      bufferedColor: Colors.grey,
                    ),
                    onReady: () => debugPrint(
                      'Ready',
                    ),
                  ),
                ),
              );
            }),
      )),
    );
  }
}
