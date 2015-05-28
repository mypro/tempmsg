--
--    Copyright 2010-2013 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--



INSERT INTO channel VALUES('1000','channel1','channel', NULL,NULL);
INSERT INTO channel VALUES('1001','channel2','channel', NULL,NULL);
INSERT INTO msge VALUES('10000','chen','msg','channel1','1000',NULL,NULL);
INSERT INTO msge VALUES('10001','wei','msg','channel2','1000',NULL,NULL);


INSERT INTO sequence VALUES('msgnum', 1000);
INSERT INTO sequence VALUES('channelnum', 1000);