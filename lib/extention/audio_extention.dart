import 'package:cloud_music/pages/home/domain/entity/song.dart';
import 'package:just_audio/just_audio.dart';

extension UriAudioSourceExtention on UriAudioSource {
  Song get song => this.tag as Song;
}
