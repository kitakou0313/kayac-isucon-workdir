# kayac isucon

## 最新スコア

```
# CPUコア数の制限が有効な時のスコア getPopularのN+1が未解消なので今はもう少し上のはず
12:37:14.363943 SCORE: 5525 (+5535 -10)
12:37:14.364168 RESULT: score.ScoreTable{"GET /api/playlist/{}":2246, "GET /api/playlists":144, "GET /api/popular_playlists":50, "GET /api/popular_playlists (login)":25, "GET /api/recent_playlists":139, "GET /api/recent_playlists (login)":100, "POST /api/login":111, "POST /api/playlist/favorite":1097, "POST /api/playlist/{}/add":48, "POST /api/playlist/{}/update":45}

# CPUコア数の制限がかからないときのスコア Docker desktop windows(Version 4.9.0 (80466))だとdeploy.resources.limits.cpusで2.0に制限してもCPU使用率が200以上になるため制限出来ていなさそう（要調査）

13:29:37.704490 SCORE: 53879 (+53879 0)
13:29:37.704635 RESULT: score.ScoreTable{"GET /api/playlist/{}":24658, "GET /api/playlists":1346, "GET /api/popular_playlists":818, "GET /api/popular_playlists (login)":435, "GET /api/recent_playlists":879, "GET /api/recent_playlists (login)":817, "POST /api/login":681, "POST /api/playlist/favorite":8123, "POST /api/playlist/{}/add":444, "POST /api/playlist/{}/update":441}
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