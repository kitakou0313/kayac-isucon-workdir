# kayac isucon

## 最新スコア

```
# CPUコア数の制限が有効な時のスコア getPopularのN+1が未解消なので今はもう少し上のはず
12:37:14.363943 SCORE: 5525 (+5535 -10)
12:37:14.364168 RESULT: score.ScoreTable{"GET /api/playlist/{}":2246, "GET /api/playlists":144, "GET /api/popular_playlists":50, "GET /api/popular_playlists (login)":25, "GET /api/recent_playlists":139, "GET /api/recent_playlists (login)":100, "POST /api/login":111, "POST /api/playlist/favorite":1097, "POST /api/playlist/{}/add":48, "POST /api/playlist/{}/update":45}

# CPUコア数の制限がかからないときのスコア Docker desktop windows(Version 4.9.0 (80466))だとdeploy.resources.limits.cpusで2.0に制限してもCPU使用率が200以上になるため制限出来ていなさそう（要調査）

10:40:39.941558 SCORE: 39850 (+40020 -170)
10:40:39.941608 RESULT: score.ScoreTable{"GET /api/playlist/{}":17170, "GET /api/playlists":982, "GET /api/popular_playlists":678, "GET /api/popular_playlists (login)":309, "GET /api/recent_playlists":775, "GET /api/recent_playlists (login)":649, "POST /api/login":547, "POST /api/playlist/favorite":6811, "POST /api/playlist/{}/add":337, "POST /api/playlist/{}/update":314}
```
