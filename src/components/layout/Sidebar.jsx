import "../../styles/sidebar.css";

const Sidebar = () => {
    return(
    <aside className="sidebar">
        <h2 className="logo">Dashboard</h2>
        <ul>
            <li>Home</li>
            <li>User</li>
            <li>Reports</li>
            <li>Settings</li>
        </ul>
    </aside>
    );
};

export default Sidebar;