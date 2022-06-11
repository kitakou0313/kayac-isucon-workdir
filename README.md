# kayac isucon

## 最新スコア

```
# CPUコア数の制限が有効な時のスコア getPopularのN+1が未解消なので今はもう少し上のはず
12:37:14.363943 SCORE: 5525 (+5535 -10)
12:37:14.364168 RESULT: score.ScoreTable{"GET /api/playlist/{}":2246, "GET /api/playlists":144, "GET /api/popular_playlists":50, "GET /api/popular_playlists (login)":25, "GET /api/recent_playlists":139, "GET /api/recent_playlists (login)":100, "POST /api/login":111, "POST /api/playlist/favorite":1097, "POST /api/playlist/{}/add":48, "POST /api/playlist/{}/update":45}

# CPUコア数の制限がかからないときのスコア Docker desktop windows(Version 4.9.0 (80466))だとdeploy.resources.limits.cpusで2.0に制限してもCPU使用率が200以上になるため制限出来ていなさそう（要調査）

15:45:21.421044 ERROR[14] load: timeout: request: timeout: Post "http://localhost/api/login": dial tcp 127.0.0.1:80: i/o timeout
15:45:21.421097 SCORE: 46781 (+46931 -150)
15:45:21.421169 RESULT: score.ScoreTable{"GET /api/playlist/{}":21166, "GET /api/playlists":1243, "GET /api/popular_playlists":647, "GET /api/popular_playlists (login)":369, "GET /api/recent_playlists":733, "GET /api/recent_playlists (login)":715, "POST /api/login":613, "POST /api/playlist/favorite":7133, "POST /api/playlist/{}/add":416, "POST /api/playlist/{}/update":414}
```

## テーブル行数
```
mysql> select table_name, table_rows from information_schema.TABLES where table_schema = 'isucon_listen80';
+-------------------+------------+
| TABLE_NAME        | TABLE_ROWS |
+-------------------+------------+
| artist            |      30075 |
| playlist          |     258990 |
| playlist_favorite |    2884448 |
| playlist_song     |    9959227 |
| sessions          |          0 |
| sessions_golang   |        455 |
| song              |     346761 |
| user              |      29922 |
+-------------------+------------+
8 rows in set (0.02 sec)
```