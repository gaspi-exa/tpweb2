class UserService {
  url = "http://localhost/projects/tpweb2/api";

  getUser = async () => {
    try {
      const resp = await fetch(`${this.url}/getUser`, {
        method: "GET",
        mode: "cors",
      });

      if (!resp.ok) {
        throw new Error(`HTTP error! status: ${resp.status}`);
      }

      return await resp.json();
    } catch (error) {
      console.error("Error fetching user:", error);
      return [];
    }
  };
}

export default UserService;
