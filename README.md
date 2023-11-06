# SIT315_Parallel_Path_Planing_Docker
[VIDEO](https://youtu.be/02Z2GojQh8s)

[REPORT](https://github.com/phulelouch/SIT315_Parallel_Path_Planning_Docker/blob/master/FINAL_REPORT.pdf)

The detected vehicle can do several things:
- Stay in its lane, which means: 
  - Speed Up,
  - Slow Down,
  - Stay at constant speed
- Change lane

The map of the highway is in data/highway_map.txt. Each waypoint in the list contains [x,y,s,dx,dy] values, x and y are the waypoint's map coordinate position, the s value is the distance along the road to get to that waypoint in meters, the dx and dy values define the unit normal vector pointing outward of the highway loop. he car should be able to make one complete loop around the 6945.554m highway.

The hardest part of the program is to doing a lot of calculations and still have to return the instruction at the right time. So, in order to do that we need to parallel the biggest calculations part which is
• going through the list of all other cars on the same side of the road and calculate if it is too close to our main car
• Going through all the previous path and calculating the trajectories we will using

The simulation will feed us constantly through HTTP about the main car's localization data with
• ["x"] The car's x position in map coordinates
• ["y"] The car's y position in map coordinates
• ["s"] The car's s position in frenet coordinates
• ["d"] The car's d position in frenet coordinates
• ["yaw"] The car's yaw angle in the map
• ["speed"] The car's speed in MPH
And we also need the previous path data given to the Planner
• ["previous_path_x"] The previous list of x points previously given to the simulator
• ["previous_path_y"] The previous list of y points previously given to the simulator
Previous path's end s and d values:
• ["end_path_s"] The previous list's last point's frenet s value
• ["end_path_d"] The previous list's last point's frenet d value Finally, sensor Fusion Data, a list of all other cars on the same side of the
road.
• ["sensor_fusion"] A 2d vector of cars and then that car's [car's unique ID, car's x position in map coordinates, car's y position in map coordinates, car's x velocity in m/s, car's y velocity in m/s, car's s position in frenet coordinates, car's d position in frenet coordinates].
