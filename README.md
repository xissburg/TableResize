# How to properly resize an UITableView/UIScrollView
This example shows what you can do to resize your tableView/scrollView without glitches. As you might know, changing the frame of them in an animation block might cause glitches when the contentOffset is at its maximum value. Now, if you don't change the frame but change the contentInset instead, there are no glitches. This is a very useful technique to adjust a tableView/scrollView when displaying a keyboard under it. Hope this helps. MIT license, if you care.