
### Explore Bike Share Data using R Programing

For this project, your goal is to ask and answer three questions about the available bikeshare data from Washington, Chicago, and New York.  This notebook can be submitted directly through the workspace when you are confident in your results.

You will be graded against the project [Rubric](https://review.udacity.com/#!/rubrics/2508/view) by a mentor after you have submitted.  To get you started, you can use the template below, but feel free to be creative in your solutions!


```R
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')
```


```R
head(ny)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th></tr></thead>
<tbody>
	<tr><td>5688089                                       </td><td>2017-06-11 14:55:05                           </td><td>2017-06-11 15:08:21                           </td><td> 795                                          </td><td>Suffolk St &amp; Stanton St                   </td><td>W Broadway &amp; Spring St                    </td><td>Subscriber                                    </td><td><span style=white-space:pre-wrap>Male  </span></td><td>1998                                          </td></tr>
	<tr><td>4096714                                                           </td><td>2017-05-11 15:30:11                                               </td><td>2017-05-11 15:41:43                                               </td><td> 692                                                              </td><td>Lexington Ave &amp; E 63 St                                       </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 78 St       </span></td><td>Subscriber                                                        </td><td><span style=white-space:pre-wrap>Male  </span>                    </td><td>1981                                                              </td></tr>
	<tr><td>2173887                                                            </td><td>2017-03-29 13:26:26                                                </td><td>2017-03-29 13:48:31                                                </td><td>1325                                                               </td><td><span style=white-space:pre-wrap>1 Pl &amp; Clinton St      </span></td><td><span style=white-space:pre-wrap>Henry St &amp; Degraw St  </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1987                                                               </td></tr>
	<tr><td>3945638                                                            </td><td>2017-05-08 19:47:18                                                </td><td>2017-05-08 19:59:01                                                </td><td> 703                                                               </td><td><span style=white-space:pre-wrap>Barrow St &amp; Hudson St  </span></td><td><span style=white-space:pre-wrap>W 20 St &amp; 8 Ave       </span> </td><td>Subscriber                                                         </td><td>Female                                                             </td><td>1986                                                               </td></tr>
	<tr><td>6208972                                                            </td><td>2017-06-21 07:49:16                                                </td><td>2017-06-21 07:54:46                                                </td><td> 329                                                               </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 44 St        </span></td><td><span style=white-space:pre-wrap>E 53 St &amp; 3 Ave       </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1992                                                               </td></tr>
	<tr><td>1285652                                                            </td><td>2017-02-22 18:55:24                                                </td><td>2017-02-22 19:12:03                                                </td><td> 998                                                               </td><td><span style=white-space:pre-wrap>State St &amp; Smith St    </span></td><td><span style=white-space:pre-wrap>Bond St &amp; Fulton St   </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1986                                                               </td></tr>
</tbody>
</table>




```R
head(wash)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th></tr></thead>
<tbody>
	<tr><td>1621326                                                                                        </td><td>2017-06-21 08:36:34                                                                            </td><td>2017-06-21 08:44:43                                                                            </td><td> 489.066                                                                                       </td><td><span style=white-space:pre-wrap>14th &amp; Belmont St NW                       </span>        </td><td><span style=white-space:pre-wrap>15th &amp; K St NW                                     </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td> 482740                                                                                        </td><td>2017-03-11 10:40:00                                                                            </td><td>2017-03-11 10:46:00                                                                            </td><td> 402.549                                                                                       </td><td><span style=white-space:pre-wrap>Yuma St &amp; Tenley Circle NW                 </span>        </td><td><span style=white-space:pre-wrap>Connecticut Ave &amp; Yuma St NW                       </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td>1330037                                                                                        </td><td>2017-05-30 01:02:59                                                                            </td><td>2017-05-30 01:13:37                                                                            </td><td> 637.251                                                                                       </td><td><span style=white-space:pre-wrap>17th St &amp; Massachusetts Ave NW             </span>        </td><td><span style=white-space:pre-wrap>5th &amp; K St NW                                      </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td> 665458                                                                                        </td><td>2017-04-02 07:48:35                                                                            </td><td>2017-04-02 08:19:03                                                                            </td><td>1827.341                                                                                       </td><td><span style=white-space:pre-wrap>Constitution Ave &amp; 2nd St NW/DOL           </span>        </td><td><span style=white-space:pre-wrap>M St &amp; Pennsylvania Ave NW                         </span></td><td><span style=white-space:pre-wrap>Customer  </span>                                             </td></tr>
	<tr><td>1481135                                                                                        </td><td>2017-06-10 08:36:28                                                                            </td><td>2017-06-10 09:02:17                                                                            </td><td>1549.427                                                                                       </td><td>Henry Bacon Dr &amp; Lincoln Memorial Circle NW                                                </td><td><span style=white-space:pre-wrap>Maine Ave &amp; 7th St SW                              </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td>1148202                                                                                </td><td>2017-05-14 07:18:18                                                                    </td><td>2017-05-14 07:24:56                                                                    </td><td> 398.000                                                                               </td><td><span style=white-space:pre-wrap>1st &amp; K St SE                              </span></td><td>Eastern Market Metro / Pennsylvania Ave &amp; 7th St SE                                </td><td>Subscriber                                                                             </td></tr>
</tbody>
</table>




```R
head(chi)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th></tr></thead>
<tbody>
	<tr><td>1423854                                                                  </td><td>2017-06-23 15:09:32                                                      </td><td>2017-06-23 15:14:53                                                      </td><td> 321                                                                     </td><td><span style=white-space:pre-wrap>Wood St &amp; Hubbard St         </span></td><td><span style=white-space:pre-wrap>Damen Ave &amp; Chicago Ave     </span> </td><td>Subscriber                                                               </td><td><span style=white-space:pre-wrap>Male  </span>                           </td><td>1992                                                                     </td></tr>
	<tr><td> 955915                                                              </td><td>2017-05-25 18:19:03                                                  </td><td>2017-05-25 18:45:53                                                  </td><td>1610                                                                 </td><td><span style=white-space:pre-wrap>Theater on the Lake          </span></td><td>Sheffield Ave &amp; Waveland Ave                                     </td><td>Subscriber                                                           </td><td>Female                                                               </td><td>1992                                                                 </td></tr>
	<tr><td><span style=white-space:pre-wrap>   9031</span>                          </td><td>2017-01-04 08:27:49                                                      </td><td>2017-01-04 08:34:45                                                      </td><td> 416                                                                     </td><td><span style=white-space:pre-wrap>May St &amp; Taylor St           </span></td><td><span style=white-space:pre-wrap>Wood St &amp; Taylor St         </span> </td><td>Subscriber                                                               </td><td><span style=white-space:pre-wrap>Male  </span>                           </td><td>1981                                                                     </td></tr>
	<tr><td> 304487                                       </td><td>2017-03-06 13:49:38                           </td><td>2017-03-06 13:55:28                           </td><td> 350                                          </td><td>Christiana Ave &amp; Lawrence Ave             </td><td>St. Louis Ave &amp; Balmoral Ave              </td><td>Subscriber                                    </td><td><span style=white-space:pre-wrap>Male  </span></td><td>1986                                          </td></tr>
	<tr><td><span style=white-space:pre-wrap>  45207</span>                          </td><td>2017-01-17 14:53:07                                                      </td><td>2017-01-17 15:02:01                                                      </td><td> 534                                                                     </td><td><span style=white-space:pre-wrap>Clark St &amp; Randolph St       </span></td><td>Desplaines St &amp; Jackson Blvd                                         </td><td>Subscriber                                                               </td><td><span style=white-space:pre-wrap>Male  </span>                           </td><td>1975                                                                     </td></tr>
	<tr><td>1473887                                                                 </td><td>2017-06-26 09:01:20                                                     </td><td>2017-06-26 09:11:06                                                     </td><td> 586                                                                    </td><td>Clinton St &amp; Washington Blvd                                        </td><td><span style=white-space:pre-wrap>Canal St &amp; Taylor St        </span></td><td>Subscriber                                                              </td><td><span style=white-space:pre-wrap>Male  </span>                          </td><td>1990                                                                    </td></tr>
</tbody>
</table>




```R
#create null columns for Gender and Birthday in the Washington dataset#
#this is to be able to join all datasets later#
wash$Gender <- NA
wash$Birth.Year <- NA
```


```R
#did it work#
head(wash)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th></tr></thead>
<tbody>
	<tr><td>1621326                                                                                        </td><td>2017-06-21 08:36:34                                                                            </td><td>2017-06-21 08:44:43                                                                            </td><td> 489.066                                                                                       </td><td><span style=white-space:pre-wrap>14th &amp; Belmont St NW                       </span>        </td><td><span style=white-space:pre-wrap>15th &amp; K St NW                                     </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td></tr>
	<tr><td> 482740                                                                                        </td><td>2017-03-11 10:40:00                                                                            </td><td>2017-03-11 10:46:00                                                                            </td><td> 402.549                                                                                       </td><td><span style=white-space:pre-wrap>Yuma St &amp; Tenley Circle NW                 </span>        </td><td><span style=white-space:pre-wrap>Connecticut Ave &amp; Yuma St NW                       </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td></tr>
	<tr><td>1330037                                                                                        </td><td>2017-05-30 01:02:59                                                                            </td><td>2017-05-30 01:13:37                                                                            </td><td> 637.251                                                                                       </td><td><span style=white-space:pre-wrap>17th St &amp; Massachusetts Ave NW             </span>        </td><td><span style=white-space:pre-wrap>5th &amp; K St NW                                      </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td></tr>
	<tr><td> 665458                                                                                        </td><td>2017-04-02 07:48:35                                                                            </td><td>2017-04-02 08:19:03                                                                            </td><td>1827.341                                                                                       </td><td><span style=white-space:pre-wrap>Constitution Ave &amp; 2nd St NW/DOL           </span>        </td><td><span style=white-space:pre-wrap>M St &amp; Pennsylvania Ave NW                         </span></td><td><span style=white-space:pre-wrap>Customer  </span>                                             </td><td>NA                                                                                             </td><td>NA                                                                                             </td></tr>
	<tr><td>1481135                                                                                        </td><td>2017-06-10 08:36:28                                                                            </td><td>2017-06-10 09:02:17                                                                            </td><td>1549.427                                                                                       </td><td>Henry Bacon Dr &amp; Lincoln Memorial Circle NW                                                </td><td><span style=white-space:pre-wrap>Maine Ave &amp; 7th St SW                              </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td></tr>
	<tr><td>1148202                                                                                </td><td>2017-05-14 07:18:18                                                                    </td><td>2017-05-14 07:24:56                                                                    </td><td> 398.000                                                                               </td><td><span style=white-space:pre-wrap>1st &amp; K St SE                              </span></td><td>Eastern Market Metro / Pennsylvania Ave &amp; 7th St SE                                </td><td>Subscriber                                                                             </td><td>NA                                                                                     </td><td>NA                                                                                     </td></tr>
</tbody>
</table>




```R
#add a new column to each dataset for City name
ny$City <- 'New York City'
head(ny)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th><th scope=col>City</th></tr></thead>
<tbody>
	<tr><td>5688089                                       </td><td>2017-06-11 14:55:05                           </td><td>2017-06-11 15:08:21                           </td><td> 795                                          </td><td>Suffolk St &amp; Stanton St                   </td><td>W Broadway &amp; Spring St                    </td><td>Subscriber                                    </td><td><span style=white-space:pre-wrap>Male  </span></td><td>1998                                          </td><td>New York City                                 </td></tr>
	<tr><td>4096714                                                           </td><td>2017-05-11 15:30:11                                               </td><td>2017-05-11 15:41:43                                               </td><td> 692                                                              </td><td>Lexington Ave &amp; E 63 St                                       </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 78 St       </span></td><td>Subscriber                                                        </td><td><span style=white-space:pre-wrap>Male  </span>                    </td><td>1981                                                              </td><td>New York City                                                     </td></tr>
	<tr><td>2173887                                                            </td><td>2017-03-29 13:26:26                                                </td><td>2017-03-29 13:48:31                                                </td><td>1325                                                               </td><td><span style=white-space:pre-wrap>1 Pl &amp; Clinton St      </span></td><td><span style=white-space:pre-wrap>Henry St &amp; Degraw St  </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1987                                                               </td><td>New York City                                                      </td></tr>
	<tr><td>3945638                                                            </td><td>2017-05-08 19:47:18                                                </td><td>2017-05-08 19:59:01                                                </td><td> 703                                                               </td><td><span style=white-space:pre-wrap>Barrow St &amp; Hudson St  </span></td><td><span style=white-space:pre-wrap>W 20 St &amp; 8 Ave       </span> </td><td>Subscriber                                                         </td><td>Female                                                             </td><td>1986                                                               </td><td>New York City                                                      </td></tr>
	<tr><td>6208972                                                            </td><td>2017-06-21 07:49:16                                                </td><td>2017-06-21 07:54:46                                                </td><td> 329                                                               </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 44 St        </span></td><td><span style=white-space:pre-wrap>E 53 St &amp; 3 Ave       </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1992                                                               </td><td>New York City                                                      </td></tr>
	<tr><td>1285652                                                            </td><td>2017-02-22 18:55:24                                                </td><td>2017-02-22 19:12:03                                                </td><td> 998                                                               </td><td><span style=white-space:pre-wrap>State St &amp; Smith St    </span></td><td><span style=white-space:pre-wrap>Bond St &amp; Fulton St   </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1986                                                               </td><td>New York City                                                      </td></tr>
</tbody>
</table>




```R
chi$City <- 'Chicago'
head(chi)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th><th scope=col>City</th></tr></thead>
<tbody>
	<tr><td>1423854                                                                  </td><td>2017-06-23 15:09:32                                                      </td><td>2017-06-23 15:14:53                                                      </td><td> 321                                                                     </td><td><span style=white-space:pre-wrap>Wood St &amp; Hubbard St         </span></td><td><span style=white-space:pre-wrap>Damen Ave &amp; Chicago Ave     </span> </td><td>Subscriber                                                               </td><td><span style=white-space:pre-wrap>Male  </span>                           </td><td>1992                                                                     </td><td>Chicago                                                                  </td></tr>
	<tr><td> 955915                                                              </td><td>2017-05-25 18:19:03                                                  </td><td>2017-05-25 18:45:53                                                  </td><td>1610                                                                 </td><td><span style=white-space:pre-wrap>Theater on the Lake          </span></td><td>Sheffield Ave &amp; Waveland Ave                                     </td><td>Subscriber                                                           </td><td>Female                                                               </td><td>1992                                                                 </td><td>Chicago                                                              </td></tr>
	<tr><td><span style=white-space:pre-wrap>   9031</span>                          </td><td>2017-01-04 08:27:49                                                      </td><td>2017-01-04 08:34:45                                                      </td><td> 416                                                                     </td><td><span style=white-space:pre-wrap>May St &amp; Taylor St           </span></td><td><span style=white-space:pre-wrap>Wood St &amp; Taylor St         </span> </td><td>Subscriber                                                               </td><td><span style=white-space:pre-wrap>Male  </span>                           </td><td>1981                                                                     </td><td>Chicago                                                                  </td></tr>
	<tr><td> 304487                                       </td><td>2017-03-06 13:49:38                           </td><td>2017-03-06 13:55:28                           </td><td> 350                                          </td><td>Christiana Ave &amp; Lawrence Ave             </td><td>St. Louis Ave &amp; Balmoral Ave              </td><td>Subscriber                                    </td><td><span style=white-space:pre-wrap>Male  </span></td><td>1986                                          </td><td>Chicago                                       </td></tr>
	<tr><td><span style=white-space:pre-wrap>  45207</span>                          </td><td>2017-01-17 14:53:07                                                      </td><td>2017-01-17 15:02:01                                                      </td><td> 534                                                                     </td><td><span style=white-space:pre-wrap>Clark St &amp; Randolph St       </span></td><td>Desplaines St &amp; Jackson Blvd                                         </td><td>Subscriber                                                               </td><td><span style=white-space:pre-wrap>Male  </span>                           </td><td>1975                                                                     </td><td>Chicago                                                                  </td></tr>
	<tr><td>1473887                                                                 </td><td>2017-06-26 09:01:20                                                     </td><td>2017-06-26 09:11:06                                                     </td><td> 586                                                                    </td><td>Clinton St &amp; Washington Blvd                                        </td><td><span style=white-space:pre-wrap>Canal St &amp; Taylor St        </span></td><td>Subscriber                                                              </td><td><span style=white-space:pre-wrap>Male  </span>                          </td><td>1990                                                                    </td><td>Chicago                                                                 </td></tr>
</tbody>
</table>




```R
wash$City <- 'Washington'
head(wash)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th><th scope=col>City</th></tr></thead>
<tbody>
	<tr><td>1621326                                                                                        </td><td>2017-06-21 08:36:34                                                                            </td><td>2017-06-21 08:44:43                                                                            </td><td> 489.066                                                                                       </td><td><span style=white-space:pre-wrap>14th &amp; Belmont St NW                       </span>        </td><td><span style=white-space:pre-wrap>15th &amp; K St NW                                     </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td><td>Washington                                                                                     </td></tr>
	<tr><td> 482740                                                                                        </td><td>2017-03-11 10:40:00                                                                            </td><td>2017-03-11 10:46:00                                                                            </td><td> 402.549                                                                                       </td><td><span style=white-space:pre-wrap>Yuma St &amp; Tenley Circle NW                 </span>        </td><td><span style=white-space:pre-wrap>Connecticut Ave &amp; Yuma St NW                       </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td><td>Washington                                                                                     </td></tr>
	<tr><td>1330037                                                                                        </td><td>2017-05-30 01:02:59                                                                            </td><td>2017-05-30 01:13:37                                                                            </td><td> 637.251                                                                                       </td><td><span style=white-space:pre-wrap>17th St &amp; Massachusetts Ave NW             </span>        </td><td><span style=white-space:pre-wrap>5th &amp; K St NW                                      </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td><td>Washington                                                                                     </td></tr>
	<tr><td> 665458                                                                                        </td><td>2017-04-02 07:48:35                                                                            </td><td>2017-04-02 08:19:03                                                                            </td><td>1827.341                                                                                       </td><td><span style=white-space:pre-wrap>Constitution Ave &amp; 2nd St NW/DOL           </span>        </td><td><span style=white-space:pre-wrap>M St &amp; Pennsylvania Ave NW                         </span></td><td><span style=white-space:pre-wrap>Customer  </span>                                             </td><td>NA                                                                                             </td><td>NA                                                                                             </td><td>Washington                                                                                     </td></tr>
	<tr><td>1481135                                                                                        </td><td>2017-06-10 08:36:28                                                                            </td><td>2017-06-10 09:02:17                                                                            </td><td>1549.427                                                                                       </td><td>Henry Bacon Dr &amp; Lincoln Memorial Circle NW                                                </td><td><span style=white-space:pre-wrap>Maine Ave &amp; 7th St SW                              </span></td><td>Subscriber                                                                                     </td><td>NA                                                                                             </td><td>NA                                                                                             </td><td>Washington                                                                                     </td></tr>
	<tr><td>1148202                                                                                </td><td>2017-05-14 07:18:18                                                                    </td><td>2017-05-14 07:24:56                                                                    </td><td> 398.000                                                                               </td><td><span style=white-space:pre-wrap>1st &amp; K St SE                              </span></td><td>Eastern Market Metro / Pennsylvania Ave &amp; 7th St SE                                </td><td>Subscriber                                                                             </td><td>NA                                                                                     </td><td>NA                                                                                     </td><td>Washington                                                                             </td></tr>
</tbody>
</table>




```R
#Creating a function to concatenate Multiple Strings
concatenation <- function(d1, d2) {
  return(rbind(d1, d2))
}
```


```R
# joining all three datasets together as "city"
city <- rbind(ny, wash)
city <- rbind(city, chi)
```


```R
head(city)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th><th scope=col>City</th></tr></thead>
<tbody>
	<tr><td>5688089                                       </td><td>2017-06-11 14:55:05                           </td><td>2017-06-11 15:08:21                           </td><td> 795                                          </td><td>Suffolk St &amp; Stanton St                   </td><td>W Broadway &amp; Spring St                    </td><td>Subscriber                                    </td><td><span style=white-space:pre-wrap>Male  </span></td><td>1998                                          </td><td>New York City                                 </td></tr>
	<tr><td>4096714                                                           </td><td>2017-05-11 15:30:11                                               </td><td>2017-05-11 15:41:43                                               </td><td> 692                                                              </td><td>Lexington Ave &amp; E 63 St                                       </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 78 St       </span></td><td>Subscriber                                                        </td><td><span style=white-space:pre-wrap>Male  </span>                    </td><td>1981                                                              </td><td>New York City                                                     </td></tr>
	<tr><td>2173887                                                            </td><td>2017-03-29 13:26:26                                                </td><td>2017-03-29 13:48:31                                                </td><td>1325                                                               </td><td><span style=white-space:pre-wrap>1 Pl &amp; Clinton St      </span></td><td><span style=white-space:pre-wrap>Henry St &amp; Degraw St  </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1987                                                               </td><td>New York City                                                      </td></tr>
	<tr><td>3945638                                                            </td><td>2017-05-08 19:47:18                                                </td><td>2017-05-08 19:59:01                                                </td><td> 703                                                               </td><td><span style=white-space:pre-wrap>Barrow St &amp; Hudson St  </span></td><td><span style=white-space:pre-wrap>W 20 St &amp; 8 Ave       </span> </td><td>Subscriber                                                         </td><td>Female                                                             </td><td>1986                                                               </td><td>New York City                                                      </td></tr>
	<tr><td>6208972                                                            </td><td>2017-06-21 07:49:16                                                </td><td>2017-06-21 07:54:46                                                </td><td> 329                                                               </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 44 St        </span></td><td><span style=white-space:pre-wrap>E 53 St &amp; 3 Ave       </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1992                                                               </td><td>New York City                                                      </td></tr>
	<tr><td>1285652                                                            </td><td>2017-02-22 18:55:24                                                </td><td>2017-02-22 19:12:03                                                </td><td> 998                                                               </td><td><span style=white-space:pre-wrap>State St &amp; Smith St    </span></td><td><span style=white-space:pre-wrap>Bond St &amp; Fulton St   </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1986                                                               </td><td>New York City                                                      </td></tr>
</tbody>
</table>



### Question 1


**What is the average travel time for users in different cities?**


```R
#Count of users in the City dataset
total_users = sort(table(city$City))
print(total_users)
```


          Chicago New York City    Washington
             8630         54770         89051



```R
# calculate the percentage of users in City
round((total_users / sum(total_users) * 100), digits = 2)
```



          Chicago New York City    Washington
             5.66         35.93         58.41



```R
#visualization

library(ggplot2)

ggplot(aes(x = City, y = Trip.Duration), data = city) +
  geom_bar(position = 'dodge', stat = "summary", width = 0.2, fun.y = "mean", fill= "deepskyblue4", colour="black") +
  ggtitle('The average travel time for users in different cities') +
  labs(y = 'Average Trip Duration', x = 'City')

```

    Warning message:
    “Removed 2 rows containing non-finite values (stat_summary).”


![png](output_16_1.png)



```R
#table results

results <- with(city, aggregate(list(Trip.Duration), by = list(City),
                                   FUN = function(x) { mon.mean = mean(x, na.rm = TRUE) } ))

colnames(results) <- c('City', 'Average.Trip.Duration')

results
```


<table>
<thead><tr><th scope=col>City</th><th scope=col>Average.Trip.Duration</th></tr></thead>
<tbody>
	<tr><td>Chicago      </td><td> 937.1728    </td></tr>
	<tr><td>New York City</td><td> 903.6147    </td></tr>
	<tr><td>Washington   </td><td>1233.9533    </td></tr>
</tbody>
</table>



**According to the data analysis, the percentage count for bikeshare data users per city is as follows:
    New York City = 35.93% (54,770)
	Chicago = 5.66 % (8,630)
	Washington = 58.41% (89,051)
Indicating that the city with the most count of users per percentage is Washington. In terms of average trip duration between cities, Washington is also the highest with 1233.9533. For New York city the average trip duration was 903.6147 and for Chicago was 937.1728 putting the close but when comparing the number of users in both cities, Chicago has less than New York City**

### Question 2

**Your question 2 goes here.**


```R
# Count of User Types (Subscriber and Customer)

total = sort(table(city$User.Type))
print(total)
```


                 Customer Subscriber
           121      30754     121576



```R
# percentage of User Types (Subscriber and Customer)
percentage = round((total / length(city$User.Type) * 100), digits = 2)
print (percentage)
```


                 Customer Subscriber
          0.08      20.17      79.75



```R
#by city
user_by_city = by(city$User.Type, city$City, summary)
print(user_by_city)
```

    city$City: Chicago
                 Customer Subscriber
             1       1746       6883
    ------------------------------------------------------------
    city$City: New York City
                 Customer Subscriber
           119       5558      49093
    ------------------------------------------------------------
    city$City: Washington
                 Customer Subscriber
             1      23450      65600



```R
#eliminate data
unique(city$User.Type)
```


<ol class=list-inline>
	<li>Subscriber</li>
	<li>Customer</li>
	<li></li>
</ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<ol class=list-inline>
		<li>''</li>
		<li>'Customer'</li>
		<li>'Subscriber'</li>
	</ol>
</details>



```R
#Eliminate blank data

city2 <- city[!(city$User.Type == ""), ]
```


```R
library(ggplot2)

ggplot(data = city2) +
  geom_bar(mapping = aes(x=City, fill= User.Type), position = "dodge", colour="black") +
  ggtitle("Type of Subscribers per City")
```


![png](output_25_0.png)


**According to the analyzed data, we can see that there are two types of users: the subscribers and the customers. Between the two of them, the largest type of users are the subscribers with 79.75% of the total users. When comparing between cities, we see that Washington has the highest number of users (both customers and subscribers) and has the highest count of subscribers when comparing to all cities.**

### Question 3

**What is the most common month?**


```R
library (lubridate)

# Format date columns to extrac day information
city$Start.Time <- ymd_hms(city$Start.Time)
city$End.Time <- ymd_hms(city$End.Time)
```


    Attaching package: ‘lubridate’

    The following object is masked from ‘package:base’:

        date

    Warning message:
    “ 1 failed to parse.”


```R
#create a new column for day of the week
city$month <- format (as.Date(city$Start.Time), "%B")
head(city)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th><th scope=col>City</th><th scope=col>month</th></tr></thead>
<tbody>
	<tr><td>5688089                                         </td><td>2017-06-11 14:55:05                             </td><td>2017-06-11 15:08:21                             </td><td> 795                                            </td><td>Suffolk St &amp; Stanton St                     </td><td>W Broadway &amp; Spring St                      </td><td>Subscriber                                      </td><td><span style=white-space:pre-wrap>Male  </span>  </td><td>1998                                            </td><td>New York City                                   </td><td><span style=white-space:pre-wrap>June    </span></td></tr>
	<tr><td>4096714                                                           </td><td>2017-05-11 15:30:11                                               </td><td>2017-05-11 15:41:43                                               </td><td> 692                                                              </td><td>Lexington Ave &amp; E 63 St                                       </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 78 St       </span></td><td>Subscriber                                                        </td><td><span style=white-space:pre-wrap>Male  </span>                    </td><td>1981                                                              </td><td>New York City                                                     </td><td><span style=white-space:pre-wrap>May     </span>                  </td></tr>
	<tr><td>2173887                                                            </td><td>2017-03-29 13:26:26                                                </td><td>2017-03-29 13:48:31                                                </td><td>1325                                                               </td><td><span style=white-space:pre-wrap>1 Pl &amp; Clinton St      </span></td><td><span style=white-space:pre-wrap>Henry St &amp; Degraw St  </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1987                                                               </td><td>New York City                                                      </td><td><span style=white-space:pre-wrap>March   </span>                   </td></tr>
	<tr><td>3945638                                                            </td><td>2017-05-08 19:47:18                                                </td><td>2017-05-08 19:59:01                                                </td><td> 703                                                               </td><td><span style=white-space:pre-wrap>Barrow St &amp; Hudson St  </span></td><td><span style=white-space:pre-wrap>W 20 St &amp; 8 Ave       </span> </td><td>Subscriber                                                         </td><td>Female                                                             </td><td>1986                                                               </td><td>New York City                                                      </td><td><span style=white-space:pre-wrap>May     </span>                   </td></tr>
	<tr><td>6208972                                                            </td><td>2017-06-21 07:49:16                                                </td><td>2017-06-21 07:54:46                                                </td><td> 329                                                               </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 44 St        </span></td><td><span style=white-space:pre-wrap>E 53 St &amp; 3 Ave       </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1992                                                               </td><td>New York City                                                      </td><td><span style=white-space:pre-wrap>June    </span>                   </td></tr>
	<tr><td>1285652                                                            </td><td>2017-02-22 18:55:24                                                </td><td>2017-02-22 19:12:03                                                </td><td> 998                                                               </td><td><span style=white-space:pre-wrap>State St &amp; Smith St    </span></td><td><span style=white-space:pre-wrap>Bond St &amp; Fulton St   </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1986                                                               </td><td>New York City                                                      </td><td>February                                                           </td></tr>
</tbody>
</table>




```R
#count per month
count = by(city$month, city$City, summary)
head(count)
```


<dl>
	<dt>$Chicago</dt>
		<dd><dl class=dl-horizontal>
	<dt>April</dt>
		<dd>1526</dd>
	<dt>February</dt>
		<dd>930</dd>
	<dt>January</dt>
		<dd>650</dd>
	<dt>June</dt>
		<dd>2816</dd>
	<dt>March</dt>
		<dd>803</dd>
	<dt>May</dt>
		<dd>1905</dd>
</dl>
</dd>
	<dt>$`New York City`</dt>
		<dd><dl class=dl-horizontal>
	<dt>April</dt>
		<dd>10661</dd>
	<dt>February</dt>
		<dd>6364</dd>
	<dt>January</dt>
		<dd>5745</dd>
	<dt>June</dt>
		<dd>14000</dd>
	<dt>March</dt>
		<dd>5820</dd>
	<dt>May</dt>
		<dd>12180</dd>
</dl>
</dd>
	<dt>$Washington</dt>
		<dd><dl class=dl-horizontal>
	<dt>April</dt>
		<dd>18522</dd>
	<dt>February</dt>
		<dd>11563</dd>
	<dt>January</dt>
		<dd>8946</dd>
	<dt>June</dt>
		<dd>20335</dd>
	<dt>March</dt>
		<dd>12612</dd>
	<dt>May</dt>
		<dd>17072</dd>
	<dt>NA's</dt>
		<dd>1</dd>
</dl>
</dd>
</dl>




```R
#eliminate that na in month on Washigton

city = subset (city, !is.na (month))
```


```R
library(ggplot2)

# Visualization
ggplot(data = city) +
  geom_bar(mapping = aes(x=month, fill= City), position = "dodge", colour="black") +
  ggtitle("Number of rides per Month")
```


![png](output_32_0.png)


**The month with the most rides between all three cities was June while the month with less rides was January. Overall Chicago is the city with less rides per month while Washington is the city with most rides per month.**


## Finishing Up

> Congratulations!  You have reached the end of the Explore Bikeshare Data Project. You should be very proud of all you have accomplished!

> **Tip**: Once you are satisfied with your work here, check over your report to make sure that it is satisfies all the areas of the [rubric](https://review.udacity.com/#!/rubrics/2508/view).


## Directions to Submit

> Before you submit your project, you need to create a .html or .pdf version of this notebook in the workspace here. To do that, run the code cell below. If it worked correctly, you should get a return code of 0, and you should see the generated .html file in the workspace directory (click on the orange Jupyter icon in the upper left).

> Alternatively, you can download this report as .html via the **File** > **Download as** submenu, and then manually upload it into the workspace directory by clicking on the orange Jupyter icon in the upper left, then using the Upload button.

> Once you've done this, you can submit your project by clicking on the "Submit Project" button in the lower right here. This will create and submit a zip file with this .ipynb doc and the .html or .pdf version you created. Congratulations!


```R
system('python -m nbconvert Explore_bikeshare_data.ipynb')
```
