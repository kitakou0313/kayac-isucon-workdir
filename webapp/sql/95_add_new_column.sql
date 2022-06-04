USE `isucon_listen80`;
-- fav count column
ALTER TABLE `playlist` ADD `fav_cnt` int NOT NULL DEFAULT 0;
UPDATE `playlist` SET `fav_cnt` = (
    SELECT count(*)
    FROM playlist_favorite
    WHERE playlist_favorite.playlist_id=playlist.id
);