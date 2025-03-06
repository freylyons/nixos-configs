{ config, lib, ... }:
let
  module = "dolphin";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "Enable the ${module} Home-Manager module";
  };

  config = lib.mkIf config.${module}.enable {
    
    home.file.".local/share/user-places.xbel".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE xbel>
      <xbel xmlns:bookmark="http://www.freedesktop.org/standards/desktop-bookmarks" xmlns:kdepriv="http://www.kde.org/kdepriv" xmlns:mime="http://www.freedesktop.org/standards/shared-mime-info">
       <info>
        <metadata owner="http://www.kde.org">
         <kde_places_version>4</kde_places_version>
         <GroupState-Places-IsHidden>false</GroupState-Places-IsHidden>
         <GroupState-Remote-IsHidden>false</GroupState-Remote-IsHidden>
         <GroupState-Devices-IsHidden>false</GroupState-Devices-IsHidden>
         <GroupState-RemovableDevices-IsHidden>false</GroupState-RemovableDevices-IsHidden>
         <GroupState-Tags-IsHidden>false</GroupState-Tags-IsHidden>
         <withRecentlyUsed>true</withRecentlyUsed>
         <GroupState-RecentlySaved-IsHidden>false</GroupState-RecentlySaved-IsHidden>
         <withBaloo>true</withBaloo>
         <GroupState-SearchFor-IsHidden>false</GroupState-SearchFor-IsHidden>
        </metadata>
       </info>


       <!-- bookmarks (places) -->


        <bookmark href="file:///home/frey">
          <title>Home</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="user-home-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/0</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/projects/job-hunting">
          <title>job-hunting</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-rpm-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1736947742/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/desktop">
          <title>Desktop</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="user-desktop"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/1</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files">
          <title>Files</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="document-multiple"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1727872574/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/projects/">
          <title>Projects</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-templates-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1732465233/2</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/learning">
          <title>Learning</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-library-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1733226753/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/documents">
          <title>Documents</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="document-multiple-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/2</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/data-books/">
          <title>Data Books</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-notes-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1732465163/1</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/downloads">
          <title>Downloads</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-download-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/3</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/media">
          <title>Media</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-development-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1732465068/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/media/music">
          <title>Music</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-music-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/6</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/media/pictures">
          <title>Pictures</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-pictures-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/7</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/files/media/videos">
          <title>Videos</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-videos-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/8</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/notes/">
          <title>Notes</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-book-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1727889115/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="remote:/">
          <title>Network</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-network"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/4</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/development/">
          <title>Development</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-git-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726579896/1</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/system">
          <title>System</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-appimage-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726579859/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///home/frey/pupperpone">
          <title>Pupperpone</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="certificate-server-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1727972844/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="trash:/">
          <title>Trash</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="user-trash"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1726527179/5</ID>
            <isSystemItem>true</isSystemItem>
           </metadata>
          </info>
         </bookmark>

         <bookmark href="file:///">
          <title>Root</title>
          <info>
           <metadata owner="http://freedesktop.org">
            <bookmark:icon name="folder-root-symbolic"/>
           </metadata>
           <metadata owner="http://www.kde.org">
            <ID>1728251540/0</ID>
            <OnlyInApp>dolphin</OnlyInApp>
           </metadata>
          </info>
         </bookmark>


        <!-- Network Folders -->

        <title>Network</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-network"/>
         </metadata>
         <metadata owner="http://www.kde.org">
          <ID>1738187256/1</ID>
          <isSystemItem>true</isSystemItem>
         </metadata>
        </info>
       </bookmark>
       <bookmark href="trash:/">
        <title>Trash</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="user-trash"/>
         </metadata>
         <metadata owner="http://www.kde.org">
          <ID>1738187256/2</ID>
          <isSystemItem>true</isSystemItem>
         </metadata>
        </info>
       </bookmark>

       <!-- Recently used ... -->

       <bookmark href="recentlyused:/files">
        <title>Recent Files</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="document-open-recent"/>
         </metadata>
         <metadata owner="http://www.kde.org">
          <ID>1738187256/3</ID>
          <isSystemItem>true</isSystemItem>
         </metadata>
        </info>
       </bookmark>
       <bookmark href="recentlyused:/locations">
        <title>Recent Locations</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-open-recent"/>
         </metadata>
         <metadata owner="http://www.kde.org">
          <ID>1738187256/4</ID>
          <isSystemItem>true</isSystemItem>
         </metadata>
        </info>
       </bookmark>
      </xbel>
    '';
  };
}
