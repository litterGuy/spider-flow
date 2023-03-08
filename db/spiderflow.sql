SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE spiderflow;
USE spiderflow;

DROP TABLE IF EXISTS `sp_flow`;
CREATE TABLE `sp_flow` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '任务名字',
  `xml` longtext DEFAULT NULL COMMENT 'xml表达式',
  `cron` varchar(255) DEFAULT NULL COMMENT 'corn表达式',
  `enabled` char(1) DEFAULT '0' COMMENT '任务是否启动,默认未启动',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP  COMMENT '创建时间',
  `last_execute_time` datetime DEFAULT NULL  COMMENT '上一次执行时间',
  `next_execute_time` datetime DEFAULT NULL   COMMENT '下一次执行时间',
  `execute_count` int(8) DEFAULT NULL  COMMENT '定时执行的已执行次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '爬虫任务表';

INSERT INTO `sp_flow` VALUES ('5e446f61336543efb269cc512dd75c5e', '快手', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;快手&quot;,&quot;submit-strategy&quot;:&quot;linked&quot;,&quot;threadCount&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"搜索\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"384\" y=\"190\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;搜索&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;method&quot;:&quot;POST&quot;,&quot;sleep&quot;:&quot;2000&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;utf-8&quot;,&quot;retryCount&quot;:&quot;&quot;,&quot;retryInterval&quot;:&quot;&quot;,&quot;cookie-name&quot;:[&quot;kpf&quot;,&quot;clientid&quot;,&quot;did&quot;,&quot;kuaishou.server.web_st&quot;,&quot;kuaishou.server.web_ph&quot;,&quot;kpn&quot;],&quot;cookie-description&quot;:[&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;],&quot;header-name&quot;:[&quot;Content-Type&quot;,&quot;User-Agent&quot;],&quot;header-description&quot;:[&quot;&quot;,&quot;&quot;],&quot;body-type&quot;:&quot;raw&quot;,&quot;body-content-type&quot;:&quot;application/json&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;https://www.kuaishou.com/graphql&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;cookie-value&quot;:[&quot;PC_WEB&quot;,&quot;3&quot;,&quot;web_7053b62174d6918f10d4a3c55b83afd8&quot;,&quot;ChZrdWFpc2hvdS5zZXJ2ZXIud2ViLnN0EqAByDMwYR2UXgdfC9LbTYPZqR5Lgxczm7FrGDsYFzlZcxwFbN4O06fmfCW8JzQW9Y-RnETTIsVLfn1s51FakdaFIFTpiDtItSqGaJN9hY17PH7oU-kCsIwTyL_Y1wKI_Xkcv9pJQu79pZCkRnl5cjjonKBDDUmJ0lkuUI-i-V3JGAnm6WNH3qdQD0lx-Kub08Ya7_iDcXgQOT-SdrMUN6wBxBoS6uws2LN-siMyPVYdMaXTUH7FIiCVnF6e_2PTRwB7Ka0z1uRhgX9MhFYxPOhOOYgt08b4cigFMAE&quot;,&quot;db12b2d72461df98e304a6f69e4a7e574389&quot;,&quot;KUAISHOU_VISION&quot;],&quot;header-value&quot;:[&quot;application/json&quot;,&quot;Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36&quot;],&quot;request-body&quot;:&quot;{\\n\\t\\&quot;operationName\\&quot;: \\&quot;visionSearchPhoto\\&quot;,\\n\\t\\&quot;variables\\&quot;: {\\n\\t\\t\\&quot;keyword\\&quot;: \\&quot;${rs.name}\\&quot;,\\n\\t\\t\\&quot;pcursor\\&quot;: \\&quot;${item}\\&quot;,\\n\\t\\t\\&quot;page\\&quot;: \\&quot;search\\&quot;\\n\\t},\\n\\t\\&quot;query\\&quot;: \\&quot;fragment photoContent on PhotoEntity {\\\\n  id\\\\n  duration\\\\n  caption\\\\n  originCaption\\\\n  likeCount\\\\n  viewCount\\\\n  realLikeCount\\\\n  coverUrl\\\\n  photoUrl\\\\n  photoH265Url\\\\n  manifest\\\\n  manifestH265\\\\n  videoResource\\\\n  coverUrls {\\\\n    url\\\\n    __typename\\\\n  }\\\\n  timestamp\\\\n  expTag\\\\n  animatedCoverUrl\\\\n  distance\\\\n  videoRatio\\\\n  liked\\\\n  stereoType\\\\n  profileUserTopPhoto\\\\n  musicBlocked\\\\n  __typename\\\\n}\\\\n\\\\nfragment feedContent on Feed {\\\\n  type\\\\n  author {\\\\n    id\\\\n    name\\\\n    headerUrl\\\\n    following\\\\n    headerUrls {\\\\n      url\\\\n      __typename\\\\n    }\\\\n    __typename\\\\n  }\\\\n  photo {\\\\n    ...photoContent\\\\n    __typename\\\\n  }\\\\n  canAddComment\\\\n  llsid\\\\n  status\\\\n  currentPcursor\\\\n  tags {\\\\n    type\\\\n    name\\\\n    __typename\\\\n  }\\\\n  __typename\\\\n}\\\\n\\\\nquery visionSearchPhoto($keyword: String, $pcursor: String, $searchSessionId: String, $page: String, $webPageArea: String) {\\\\n  visionSearchPhoto(keyword: $keyword, pcursor: $pcursor, searchSessionId: $searchSessionId, page: $page, webPageArea: $webPageArea) {\\\\n    result\\\\n    llsid\\\\n    webPageArea\\\\n    feeds {\\\\n      ...feedContent\\\\n      __typename\\\\n    }\\\\n    searchSessionId\\\\n    pcursor\\\\n    aladdinBanner {\\\\n      imgUrl\\\\n      link\\\\n      __typename\\\\n    }\\\\n    __typename\\\\n  }\\\\n}\\\\n\\&quot;\\n}&quot;,&quot;follow-redirect&quot;:&quot;1&quot;,&quot;tls-validate&quot;:&quot;1&quot;,&quot;cookie-auto-set&quot;:&quot;1&quot;,&quot;repeat-enable&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"解析json\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"510\" y=\"190\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;解析json&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;jsondata&quot;,&quot;feeds&quot;],&quot;variable-description&quot;:[&quot;&quot;,&quot;&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${json.parse(resp.html)}&quot;,&quot;${jsondata.data.visionSearchPhoto.feeds}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"3\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"620\" y=\"190\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;i&quot;,&quot;datasourceId&quot;:&quot;04b8eadbec15836a8d7664819e29e63e&quot;,&quot;tableName&quot;:&quot;&quot;,&quot;csvName&quot;:&quot;&quot;,&quot;csvEncoding&quot;:&quot;GBK&quot;,&quot;output-name&quot;:[&quot;author&quot;,&quot;headerUrl&quot;,&quot;author_id&quot;,&quot;publish_time&quot;,&quot;realLikeCount&quot;,&quot;title&quot;,&quot;cover_img&quot;,&quot;photo_url&quot;,&quot;linked&quot;,&quot;page&quot;],&quot;loopCount&quot;:&quot;${list.length(feeds)}&quot;,&quot;output-value&quot;:[&quot;${feeds[i].author.name}&quot;,&quot;${feeds[i].author.headerUrl}&quot;,&quot;${feeds[i].author.id}&quot;,&quot;${feeds[i].photo.timestamp}&quot;,&quot;${feeds[i].photo.realLikeCount}&quot;,&quot;${feeds[i].photo.caption}&quot;,&quot;${feeds[i].photo.coverUrl}&quot;,&quot;${feeds[i].photo.photoUrl}&quot;,&quot;https://www.kuaishou.com/short-video/${feeds[i].photo.id}&quot;,&quot;${jsondata.data.visionSearchPhoto.pcursor}&quot;],&quot;output-all&quot;:&quot;0&quot;,&quot;output-database&quot;:&quot;0&quot;,&quot;output-csv&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"5\" target=\"7\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"11\" value=\"执行SQL\" style=\"executeSql\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"190\" y=\"190\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;执行SQL&quot;,&quot;datasourceId&quot;:&quot;04b8eadbec15836a8d7664819e29e63e&quot;,&quot;statementType&quot;:&quot;selectOne&quot;,&quot;sql&quot;:&quot;select name from project;&quot;,&quot;isStream&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;executeSql&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"12\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"2\" target=\"11\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"27\" value=\"循环\" style=\"loop\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"280\" y=\"190\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;循环&quot;,&quot;loopItem&quot;:&quot;&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;loopCount&quot;:&quot;30&quot;,&quot;loopStart&quot;:&quot;0&quot;,&quot;loopEnd&quot;:&quot;-1&quot;,&quot;shape&quot;:&quot;loop&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"28\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"11\" target=\"27\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"31\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"27\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', NULL, '0', '2023-03-07 11:45:48', NULL, NULL, NULL);
INSERT INTO `sp_flow` VALUES ('663aaa5e36a84c9594ef3cfd6738e9a7', '百度热点', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;百度热点&quot;,&quot;submit-strategy&quot;:&quot;random&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"开始抓取\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"220\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;开始抓取&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;utf-8&quot;,&quot;retryCount&quot;:&quot;&quot;,&quot;retryInterval&quot;:&quot;&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;https://top.baidu.com/board?tab=realtime&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:&quot;&quot;,&quot;follow-redirect&quot;:&quot;1&quot;,&quot;tls-validate&quot;:&quot;1&quot;,&quot;cookie-auto-set&quot;:&quot;1&quot;,&quot;repeat-enable&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"定义变量\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"360\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;定义变量&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;elementbd&quot;],&quot;variable-description&quot;:[&quot;&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${resp.xpaths(&#39;//*[@id=\\&quot;sanRoot\\&quot;]/main/div[2]/div/div[2]/div&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"480\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;i&quot;,&quot;datasourceId&quot;:&quot;04b8eadbec15836a8d7664819e29e63e&quot;,&quot;tableName&quot;:&quot;&quot;,&quot;csvName&quot;:&quot;&quot;,&quot;csvEncoding&quot;:&quot;GBK&quot;,&quot;output-name&quot;:[&quot;图片&quot;,&quot;名称&quot;,&quot;地址&quot;,&quot;百度指数&quot;,&quot;摘要&quot;],&quot;loopCount&quot;:&quot;${elementbd.size()-1}&quot;,&quot;output-value&quot;:[&quot;${elementbd[i+1].xpath(&#39;//a/img/@src&#39;)}&quot;,&quot;${elementbd[i+1].xpath(&#39;//img/div[1]/a/div[1]/text()&#39;)}&quot;,&quot;${elementbd[i+1].xpath(&#39;//div[2]/a/@href&#39;)}&quot;,&quot;${elementbd[i+1].xpath(&#39;//div[1]/div[2]/text()&#39;)}&quot;,&quot;${elementbd[i+1].xpath(&#39;//img/div[1]/div[2]/text()&#39;)}&quot;],&quot;output-all&quot;:&quot;0&quot;,&quot;output-database&quot;:&quot;0&quot;,&quot;output-csv&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" parent=\"1\" source=\"2\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"\" parent=\"1\" source=\"3\" target=\"4\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" parent=\"1\" source=\"4\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', '* * * * * ? *', '0', '2019-10-20 17:24:21', '2023-03-07 11:23:49', NULL, 91);
INSERT INTO `sp_flow` VALUES ('f0a67f17ee1a498a9b2f4ca30556f3c3', '抓取每日菜价', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;抓取每日菜价&quot;,&quot;submit-strategy&quot;:&quot;random&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"开始抓取\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"219.83334350585938\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;开始抓取&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;http://www.beijingprice.cn:8086/price/priceToday/PageLoad/LoadPrice?jsoncallback=1&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:[&quot;&quot;],&quot;follow-redirect&quot;:&quot;1&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"\" parent=\"1\" source=\"2\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"解析JSON\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"350\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;解析JSON&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;jsonstr&quot;,&quot;jsondata&quot;,&quot;data&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${string.substring(resp.html,2,resp.html.length()-1)}&quot;,&quot;${json.parse(jsonstr)}&quot;,&quot;${extract.jsonpath(jsondata[0],&#39;data&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" parent=\"1\" source=\"3\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"480.16668701171875\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;i&quot;,&quot;datasourceId&quot;:&quot;04b8eadbec15836a8d7664819e29e63e&quot;,&quot;tableName&quot;:&quot;vegetable_price&quot;,&quot;csvName&quot;:&quot;&quot;,&quot;csvEncoding&quot;:&quot;GBK&quot;,&quot;output-name&quot;:[&quot;name&quot;,&quot;price&quot;,&quot;unit&quot;],&quot;loopCount&quot;:&quot;${list.length(data)}&quot;,&quot;output-value&quot;:[&quot;${data[i].ItemName}&quot;,&quot;${data[i].Price04}&quot;,&quot;${data[i].ItemUnit}&quot;],&quot;output-all&quot;:&quot;0&quot;,&quot;output-database&quot;:&quot;1&quot;,&quot;output-csv&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" parent=\"1\" source=\"5\" target=\"7\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', NULL, '0', '2019-08-22 13:48:22', '2023-03-07 10:02:51', NULL, 1);

DROP TABLE IF EXISTS `sp_datasource`;
CREATE TABLE `sp_datasource` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `driver_class_name` varchar(255) DEFAULT NULL,
  `jdbc_url` varchar(255) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sp_datasource` VALUES ('04b8eadbec15836a8d7664819e29e63e', 'mysql', 'com.mysql.jdbc.Driver', 'jdbc:mysql://192.168.10.160:3306/wangwei_spiderflow?useSSL=false&useUnicode=true&characterEncoding=UTF8&autoReconnect=true', 'wangwei', 'wangwei123', '2023-03-07 09:56:48');


DROP TABLE IF EXISTS `sp_variable`;
CREATE TABLE `sp_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '变量名',
  `value` varchar(512) DEFAULT NULL COMMENT '变量值',
  `description` varchar(255) DEFAULT NULL COMMENT '变量描述',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/* v0.3.0 新增 */
DROP TABLE IF EXISTS `sp_task`;
CREATE TABLE `sp_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` varchar(32) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO `sp_task` VALUES (7, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:24:05', '2023-03-07 09:24:06');
INSERT INTO `sp_task` VALUES (8, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:30:00', '2023-03-07 09:30:00');
INSERT INTO `sp_task` VALUES (9, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:04', '2023-03-07 09:41:04');
INSERT INTO `sp_task` VALUES (10, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:04', '2023-03-07 09:41:04');
INSERT INTO `sp_task` VALUES (11, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:05', '2023-03-07 09:41:06');
INSERT INTO `sp_task` VALUES (12, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:06', '2023-03-07 09:41:07');
INSERT INTO `sp_task` VALUES (13, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:07', '2023-03-07 09:41:07');
INSERT INTO `sp_task` VALUES (14, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:08', '2023-03-07 09:41:08');
INSERT INTO `sp_task` VALUES (15, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:09', '2023-03-07 09:41:09');
INSERT INTO `sp_task` VALUES (16, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:10', '2023-03-07 09:41:10');
INSERT INTO `sp_task` VALUES (17, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:11', '2023-03-07 09:41:11');
INSERT INTO `sp_task` VALUES (18, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:12', '2023-03-07 09:41:12');
INSERT INTO `sp_task` VALUES (19, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:13', '2023-03-07 09:41:13');
INSERT INTO `sp_task` VALUES (20, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:14', '2023-03-07 09:41:14');
INSERT INTO `sp_task` VALUES (21, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:15', '2023-03-07 09:41:15');
INSERT INTO `sp_task` VALUES (22, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:16', '2023-03-07 09:41:16');
INSERT INTO `sp_task` VALUES (23, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:17', '2023-03-07 09:41:17');
INSERT INTO `sp_task` VALUES (24, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:18', '2023-03-07 09:41:18');
INSERT INTO `sp_task` VALUES (25, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:19', '2023-03-07 09:41:19');
INSERT INTO `sp_task` VALUES (26, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:20', '2023-03-07 09:41:20');
INSERT INTO `sp_task` VALUES (27, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:21', '2023-03-07 09:41:21');
INSERT INTO `sp_task` VALUES (28, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:22', '2023-03-07 09:41:22');
INSERT INTO `sp_task` VALUES (29, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:23', '2023-03-07 09:41:23');
INSERT INTO `sp_task` VALUES (30, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:24', '2023-03-07 09:41:24');
INSERT INTO `sp_task` VALUES (31, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:25', '2023-03-07 09:41:25');
INSERT INTO `sp_task` VALUES (32, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:26', '2023-03-07 09:41:26');
INSERT INTO `sp_task` VALUES (33, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:27', '2023-03-07 09:41:27');
INSERT INTO `sp_task` VALUES (34, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:28', '2023-03-07 09:41:28');
INSERT INTO `sp_task` VALUES (35, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:29', '2023-03-07 09:41:29');
INSERT INTO `sp_task` VALUES (36, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:30', '2023-03-07 09:41:30');
INSERT INTO `sp_task` VALUES (37, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:31', '2023-03-07 09:41:31');
INSERT INTO `sp_task` VALUES (38, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:32', '2023-03-07 09:41:32');
INSERT INTO `sp_task` VALUES (39, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:33', '2023-03-07 09:41:33');
INSERT INTO `sp_task` VALUES (40, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:34', '2023-03-07 09:41:34');
INSERT INTO `sp_task` VALUES (41, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:35', '2023-03-07 09:41:35');
INSERT INTO `sp_task` VALUES (42, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:36', '2023-03-07 09:41:36');
INSERT INTO `sp_task` VALUES (43, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:37', '2023-03-07 09:41:37');
INSERT INTO `sp_task` VALUES (44, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:38', '2023-03-07 09:41:38');
INSERT INTO `sp_task` VALUES (45, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:39', '2023-03-07 09:41:39');
INSERT INTO `sp_task` VALUES (46, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:40', '2023-03-07 09:41:40');
INSERT INTO `sp_task` VALUES (47, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:41', '2023-03-07 09:41:41');
INSERT INTO `sp_task` VALUES (48, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:42', '2023-03-07 09:41:42');
INSERT INTO `sp_task` VALUES (49, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:43', '2023-03-07 09:41:43');
INSERT INTO `sp_task` VALUES (50, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:44', '2023-03-07 09:41:44');
INSERT INTO `sp_task` VALUES (51, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 09:41:45', '2023-03-07 09:41:45');
INSERT INTO `sp_task` VALUES (52, 'f0a67f17ee1a498a9b2f4ca30556f3c3', '2023-03-07 10:02:51', '2023-03-07 10:02:51');
INSERT INTO `sp_task` VALUES (53, '663aaa5e36a84c9594ef3cfd6738e9a7', '2023-03-07 11:23:49', '2023-03-07 11:23:49');

/* v0.4.0 新增 */
DROP TABLE IF EXISTS `sp_function`;
CREATE TABLE `sp_function`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '函数名',
  `parameter` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'js脚本',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

/* v0.5.0 新增 */
DROP TABLE IF EXISTS `sp_flow_notice`;
CREATE TABLE `sp_flow_notice` (
  `id` varchar(32) NOT NULL,
  `recipients` varchar(200) DEFAULT NULL COMMENT '收件人',
  `notice_way` char(10) DEFAULT NULL COMMENT '通知方式',
  `start_notice` char(1) DEFAULT '0' COMMENT '流程开始通知:1:开启通知,0:关闭通知',
  `exception_notice` char(1) DEFAULT '0' COMMENT '流程异常通知:1:开启通知,0:关闭通知',
  `end_notice` char(1) DEFAULT '0' COMMENT '流程结束通知:1:开启通知,0:关闭通知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '爬虫任务通知表';

-- ----------------------------
-- Table structure for vegetable_price
-- ----------------------------
DROP TABLE IF EXISTS `vegetable_price`;
CREATE TABLE `vegetable_price`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜名',
    `price` double NOT NULL COMMENT '菜价',
    `unit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vegetable_price
-- ----------------------------
INSERT INTO `vegetable_price` VALUES (63, '平菇', 5.54, '元/斤');
INSERT INTO `vegetable_price` VALUES (64, '土豆', 2.49, '元/斤');
INSERT INTO `vegetable_price` VALUES (65, '心里美萝卜', 1.91, '元/斤');
INSERT INTO `vegetable_price` VALUES (66, '生菜', 5.94, '元/斤');
INSERT INTO `vegetable_price` VALUES (67, '青椒', 5.29, '元/斤');
INSERT INTO `vegetable_price` VALUES (68, '豆角', 7.16, '元/斤');
INSERT INTO `vegetable_price` VALUES (69, '大白菜', 0.73, '元/斤');
INSERT INTO `vegetable_price` VALUES (70, '小白菜', 4.61, '元/斤');
INSERT INTO `vegetable_price` VALUES (71, '黄豆芽', 2.39, '元/斤');
INSERT INTO `vegetable_price` VALUES (72, '胡萝卜', 1.82, '元/斤');
INSERT INTO `vegetable_price` VALUES (73, '圆茄子', 4.59, '元/斤');
INSERT INTO `vegetable_price` VALUES (74, '油麦菜', 6.07, '元/斤');
INSERT INTO `vegetable_price` VALUES (75, '绿豆芽', 2.29, '元/斤');
INSERT INTO `vegetable_price` VALUES (76, '芹菜', 1.79, '元/斤');
INSERT INTO `vegetable_price` VALUES (77, '冬瓜', 2.07, '元/斤');
INSERT INTO `vegetable_price` VALUES (78, '莴笋', 3.47, '元/斤');
INSERT INTO `vegetable_price` VALUES (79, '菜花', 4.19, '元/斤');
INSERT INTO `vegetable_price` VALUES (80, '白萝卜', 1.24, '元/斤');
INSERT INTO `vegetable_price` VALUES (81, '生姜', 8.28, '元/斤');
INSERT INTO `vegetable_price` VALUES (82, '油菜', 3.99, '元/斤');
INSERT INTO `vegetable_price` VALUES (83, '黄瓜', 4.36, '元/斤');
INSERT INTO `vegetable_price` VALUES (84, '蒜苗', 7.53, '元/斤');
INSERT INTO `vegetable_price` VALUES (85, '大葱', 2.63, '元/斤');
INSERT INTO `vegetable_price` VALUES (86, '西红柿', 3.82, '元/斤');
INSERT INTO `vegetable_price` VALUES (87, '韭菜', 4.55, '元/斤');
INSERT INTO `vegetable_price` VALUES (88, '尖椒', 5.57, '元/斤');
INSERT INTO `vegetable_price` VALUES (89, '大蒜', 4.79, '元/斤');
INSERT INTO `vegetable_price` VALUES (90, '圆白菜', 2.37, '元/斤');
INSERT INTO `vegetable_price` VALUES (91, '菠菜', 4.41, '元/斤');
INSERT INTO `vegetable_price` VALUES (92, '葱头', 1.88, '元/斤');
INSERT INTO `vegetable_price` VALUES (93, '苦瓜', 6.87, '元/斤');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '监控词',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监控方案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '刺客伍六七');