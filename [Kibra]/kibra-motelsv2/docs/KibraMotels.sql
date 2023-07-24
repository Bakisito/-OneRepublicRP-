CREATE TABLE `kibra-motels` (
  `id` int(11) NOT NULL,
  `motelid` int(11) NOT NULL,
  `roomid` varchar(255) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `pdata` varchar(255) NOT NULL,
  `invoiceseen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `kibra-motels-business` (
  `id` int(11) NOT NULL,
  `motel` varchar(255) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `money` float NOT NULL,
  `roomprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `kibra-motels-cache` (
  `id` int(11) NOT NULL,
  `rid` text NOT NULL,
  `citizenid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `kibra-motels`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `kibra-motels-business`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `kibra-motels-cache`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `kibra-motels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

ALTER TABLE `kibra-motels-business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `kibra-motels-cache`
     MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
