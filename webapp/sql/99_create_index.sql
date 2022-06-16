-- Song table index
CREATE INDEX ulid_index ON isucon_listen80.song (ulid);

-- playlist index
CREATE INDEX ulid_index ON isucon_listen80.playlist (ulid);
CREATE INDEX is_pub_created_at ON isucon_listen80.playlist (is_public, created_at);
CREATE INDEX is_pub_fav_cnt ON isucon_listen80.playlist (is_public, fav_cnt);
CREATE INDEX user_acc_created ON isucon_listen80.playlist (user_account, created_at);
CREATE INDEX is_pub_id ON isucon_listen80.playlist (is_pub, id);


-- user index
CREATE INDEX is_ban_account ON isucon_listen80.user (is_ban, account);

-- playlist_song index
CREATE INDEX playlist_id_idx ON isucon_listen80.playlist_song (playlist_id);

-- playlist_favorite index
CREATE INDEX playlist_id_idx ON isucon_listen80.playlist_favorite (playlist_id);
CREATE INDEX playlist_id_user_acc_idx ON isucon_listen80.playlist_favorite (playlist_id,favorite_user_account);
CREATE INDEX user_acc__created_idx ON isucon_listen80.playlist_favorite (favorite_user_account, created_at);

